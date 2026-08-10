# scripts/python/build_tools.py
import argparse
import json
import os
import platform
import shutil
import subprocess
import sys
import urllib.request
from pathlib import Path


class BuildOrchestrator:
    """Orchestrates the SDK build process."""

    def __init__(self):
        """Initializes paths and configuration based on the OS."""
        self.ROOT_DIR = Path(__file__).parent.parent.parent.resolve()
        self.JRE_DIR = self.ROOT_DIR / ".local_jre"
        self.CLIENTS_DIR = self.ROOT_DIR / "clients"
        self.OPENAPI_DIR = self.ROOT_DIR / "openapi"
        self.SCRIPTS_DIR = self.ROOT_DIR / "scripts"
        self.GENERATOR_JAR = self.ROOT_DIR / "openapi-generator-cli.jar"
        self.PUBLIC_SPEC_PATH = self.OPENAPI_DIR / "openapi-public.json"

        self.os = platform.system()
        print(f"--- Detected OS: {self.os} ---")

    def _run_subprocess(self, cmd, **kwargs):
        """Helper to run a subprocess and stream its output."""
        # Cross-platform fix: Windows requires shell=True to look up system PATH commands like Rscript/R
        if self.os == "Windows":
            kwargs["shell"] = True

        print(f"Running command: {' '.join(str(c) for c in cmd)}")
        process = subprocess.Popen(
            cmd, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True, **kwargs
        )
        for line in process.stdout:
            print(line, end="", flush=True)
        retcode = process.wait()
        if retcode != 0:
            print(f"Command failed with exit code {retcode}", file=sys.stderr)
            sys.exit(retcode)

    def _run_version_manager(self):
        """Runs the version manager script to check for spec changes."""
        self._run_subprocess(
            [sys.executable, str(self.SCRIPTS_DIR / "python" / "version_manager.py")]
        )

    def _download_file(self, url, dest_path):
        """Downloads a file from a URL to a local destination, spoofing a browser User-Agent."""
        print(f"Downloading {url} to {dest_path}...")
        req = urllib.request.Request(
            url,
            headers={
                "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36"
            },
        )
        with (
            urllib.request.urlopen(req, timeout=10) as response,
            open(dest_path, "wb") as out_file,
        ):
            shutil.copyfileobj(response, out_file)

    def fetch_specs(self):
        """Downloads and formats the public OpenAPI specification."""
        print(">>> Fetching public OpenAPI spec...")
        url = "https://www.webapps.nwfsc.noaa.gov/data-catalog/api/v1/docs/openapi.json"
        self.OPENAPI_DIR.mkdir(exist_ok=True)

        try:
            req = urllib.request.Request(
                url,
                headers={
                    "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36"
                },
            )
            with urllib.request.urlopen(req, timeout=10) as response:
                raw_json_str = response.read().decode('utf-8')

            # --- SANITIZE DUPLICATED NAMES GLOBALLY ---
            print(">>> Sanitizing duplicated names globally...")
            raw_json_str = raw_json_str.replace("BottomTrawlBottomTrawl", "BottomTrawl")
            raw_json_str = raw_json_str.replace("HookAndLineHookAndLine", "HookAndLine")
            raw_json_str = raw_json_str.replace("bottom-trawl/bottom-trawl", "bottom-trawl")
            raw_json_str = raw_json_str.replace("hook-and-line/hook-and-line", "hook-and-line")
            raw_json_str = raw_json_str.replace("bottom_trawl_bottom_trawl", "bottom_trawl")
            raw_json_str = raw_json_str.replace("hook_and_line_hook_and_line", "hook_and_line")

            data = json.loads(raw_json_str)

            # Save the main public spec
            self.PUBLIC_SPEC_PATH.write_text(json.dumps(data, indent=2))
            print(f"Live spec saved to {self.PUBLIC_SPEC_PATH}")

            # --- CREATE SLIM SPEC FOR LLM ---
            print(">>> Generating slim OpenAPI spec for LLM context...")

            # Create a detached copy in memory using json dumps/loads so we don't mutate the original
            slim_spec = json.loads(json.dumps(data))

            # 1. Clean paths: Keep endpoint metadata & query params, drop HTTP response bloat
            for path, methods in slim_spec.get("paths", {}).items():
                for method, details in methods.items():
                    # Strip out the huge 200/302 binary response payloads
                    details["responses"] = {"200": {"description": "Success"}}

                    # Remove redundant component parameter refs
                    if "parameters" in details:
                        details["parameters"] = [
                            p for p in details["parameters"] if "$ref" not in p
                        ]

            # 2. Clean schemas: Strip internal UI styling & storage metadata, keep field names & descriptions
            for schema_name, schema_def in (
                slim_spec.get("components", {}).get("schemas", {}).items()
            ):
                if "properties" in schema_def:
                    for prop_name, prop_meta in schema_def["properties"].items():
                        # Strip internal UI/storage tags to save thousands of tokens
                        prop_meta.pop("x-nwfsc-ui", None)
                        prop_meta.pop("x-nwfsc-source-type", None)
                        prop_meta.pop("x-nwfsc-storage-type", None)
                        prop_meta.pop("x-nwfsc-access-tier", None)

            # 3. Save as a minified text file (no extra spaces/newlines)
            slim_spec_path = self.OPENAPI_DIR / "openapi-public-slim.json"
            with open(slim_spec_path, "w") as f:
                json.dump(slim_spec, f, separators=(",", ":"))

            print(f"Slim spec saved to {slim_spec_path}")

        except (urllib.error.URLError, TimeoutError):
            print(
                "Warning: Could not fetch live spec (Timeout/VPN). Falling back to checked-in local copy."
            )
            if not self.PUBLIC_SPEC_PATH.exists():
                raise RuntimeError(
                    "Fatal: Could not fetch live spec and no local fallback copy exists."
                )

    def bootstrap_java(self):
        """Downloads and extracts a portable JRE if not already present."""
        print(">>> Bootstrapping portable Java 17 JRE...")
        stamp_file = self.JRE_DIR / "ok.stamp"
        java_exe = None

        if stamp_file.exists():
            try:
                if self.os == "Windows":
                    java_exe = next(self.JRE_DIR.rglob("java.exe"))
                else:
                    java_exe = next(self.JRE_DIR.rglob("bin/java"))
                print(f"Found existing JRE at: {java_exe}")
                return java_exe
            except StopIteration:
                print("Stamp file found, but JRE is missing. Re-bootstrapping...")
                shutil.rmtree(self.JRE_DIR, ignore_errors=True)

        self.JRE_DIR.mkdir(parents=True, exist_ok=True)
        extract_dir = self.JRE_DIR / "extracted"
        extract_dir.mkdir(exist_ok=True)

        if self.os == "Windows":
            jre_url = "https://api.adoptium.net/v3/binary/latest/17/ga/windows/x64/jre/hotspot/normal/eclipse?project=jdk"
            archive_path = self.JRE_DIR / "jre.zip"
            self._download_file(jre_url, archive_path)
            shutil.unpack_archive(archive_path, extract_dir)
        else:  # Linux/macOS
            jre_url = "https://api.adoptium.net/v3/binary/latest/17/ga/linux/x64/jre/hotspot/normal/eclipse?project=jdk"
            archive_path = self.JRE_DIR / "jre.tar.gz"
            self._download_file(jre_url, archive_path)
            shutil.unpack_archive(archive_path, extract_dir)

        archive_path.unlink()
        stamp_file.touch()
        print("JRE bootstrapped successfully.")

        if self.os == "Windows":
            return next(self.JRE_DIR.rglob("java.exe"))
        else:
            java_path = next(self.JRE_DIR.rglob("bin/java"))
            java_path.chmod(0o755)
            return java_path

    def bootstrap_pandoc(self):
        """Downloads and extracts a portable Pandoc if not already present."""
        pandoc_dir = self.ROOT_DIR / ".local_tools" / "pandoc"
        extract_dir = pandoc_dir / "extracted"
        stamp_file = pandoc_dir / "ok.stamp"

        if stamp_file.exists():
            try:
                if self.os == "Windows":
                    pandoc_exe = next(extract_dir.rglob("pandoc.exe"))
                else:
                    pandoc_exe = next(extract_dir.rglob("bin/pandoc"))
                print(f"Found existing Pandoc at: {pandoc_exe}")
                return pandoc_exe.parent.as_posix()
            except StopIteration:
                print("Stamp file found, but Pandoc is missing. Re-bootstrapping...")
                shutil.rmtree(pandoc_dir, ignore_errors=True)

        pandoc_dir.mkdir(parents=True, exist_ok=True)
        extract_dir.mkdir(exist_ok=True)

        if self.os == "Windows":
            pandoc_url = "https://github.com/jgm/pandoc/releases/download/3.1.11/pandoc-3.1.11-windows-x86_64.zip"
            archive_path = pandoc_dir / "pandoc.zip"
        else:
            pandoc_url = "https://github.com/jgm/pandoc/releases/download/3.1.11/pandoc-3.1.11-linux-amd64.tar.gz"
            archive_path = pandoc_dir / "pandoc.tar.gz"

        self._download_file(pandoc_url, archive_path)
        shutil.unpack_archive(archive_path, extract_dir)

        archive_path.unlink()
        stamp_file.touch()
        print("Pandoc bootstrapped successfully.")

        if self.os == "Windows":
            return next(extract_dir.rglob("pandoc.exe")).parent.as_posix()
        else:
            pandoc_path = next(extract_dir.rglob("bin/pandoc"))
            pandoc_path.chmod(0o755)
            return pandoc_path.parent.as_posix()

    def fetch_generator(self):
        """Downloads the OpenAPI generator JAR if not present."""
        if self.GENERATOR_JAR.exists():
            print("OpenAPI Generator JAR already exists.")
            return
        print(">>> Fetching OpenAPI Generator JAR...")
        url = "https://repo1.maven.org/maven2/org/openapitools/openapi-generator-cli/7.5.0/openapi-generator-cli-7.5.0.jar"
        self._download_file(url, self.GENERATOR_JAR)
        print("Generator JAR downloaded.")

    def build_sdk(self, lang, scope="public"):
        """Builds the specified SDK."""
        if scope != "public":
            raise NotImplementedError("Only public scope is currently supported.")

        # Run version manager first to bump versions if spec has changed
        self._run_version_manager()

        java_path = self.bootstrap_java()
        self.fetch_generator()

        if lang == "python":
            self._build_python_public(java_path)
        elif lang == "r":
            self._build_r_public(java_path)
        else:
            raise NotImplementedError(f"Language '{lang}' is not supported.")

    def docs_r(self):
        """Builds the R documentation using a bootstrapped Pandoc."""
        pandoc_path = self.bootstrap_pandoc()
        os.environ["RSTUDIO_PANDOC"] = pandoc_path

        self._run_subprocess(
            [
                "Rscript",
                "-e",
                "if (!requireNamespace('pkgdown', quietly = TRUE)) install.packages('pkgdown', repos='https://cloud.r-project.org'); pkgdown::clean_site(pkg='clients/r_public', force=TRUE); pkgdown::build_site(pkg='clients/r_public')",
            ]
        )

    def _build_python_public(self, java_path):
        print(">>> Building Python Public Client...")
        pkg_name = "nwfsc_data_catalog"
        gen_dir = self.ROOT_DIR / "gen_py_pub"
        client_dir = self.CLIENTS_DIR / "python_public"
        src_dir = client_dir / "src" / pkg_name

        shutil.rmtree(gen_dir, ignore_errors=True)
        shutil.rmtree(client_dir / "dist", ignore_errors=True)

        cmd = [
            str(java_path),
            "-jar",
            str(self.GENERATOR_JAR),
            "generate",
            "-i",
            str(self.OPENAPI_DIR / "openapi-public.json"),
            "-g",
            "python",
            "-o",
            str(gen_dir),
            "--package-name",
            pkg_name,
            "--additional-properties=generateSourceCodeOnly=true",
        ]
        self._run_subprocess(cmd)

        src_dir.mkdir(parents=True, exist_ok=True)
        shutil.copytree(gen_dir / pkg_name, src_dir, dirs_exist_ok=True)
        shutil.copy(self.SCRIPTS_DIR / "python" / "factory.py", src_dir)
        shutil.copy(self.SCRIPTS_DIR / "python" / "mcp_server.py", src_dir)
        shutil.copy(self.SCRIPTS_DIR / "python" / "assessment_skills.py", src_dir)
        (src_dir / "py.typed").touch()
        with (src_dir / "__init__.py").open("a") as f:
            f.write("\nfrom .factory import DataCatalog\n")

        self._run_subprocess(["uv", "build"], cwd=client_dir)
        shutil.rmtree(gen_dir)

        print(">>> Testing the built python wheel...")
        venv_dir = client_dir / ".venv"
        shutil.rmtree(venv_dir, ignore_errors=True)

        # Ensure the virtual environment is seeded with pip
        self._run_subprocess(["uv", "venv", "--seed", str(venv_dir)])

        try:
            wheel_path = next((client_dir / "dist").glob("*.whl"))
        except StopIteration:
            print(
                "Build failed: No wheel file found in dist/ directory.", file=sys.stderr
            )
            sys.exit(1)

        python_exe = (
            venv_dir / "Scripts" / "python.exe"
            if self.os == "Windows"
            else venv_dir / "bin" / "python"
        )

        # On Windows, use standard pip (slower, avoids AV locks).
        # On Linux, use uv (blazing fast).
        if self.os == "Windows":
            print(">>> Using standard pip on Windows to avoid AV file locking...")
            self._run_subprocess(
                [
                    str(python_exe),
                    "-m",
                    "pip",
                    "install",
                    "--no-cache-dir",
                    str(wheel_path),
                    "pytest",
                    "responses",
                    "pdoc",
                    "openapi-spec-validator",
                ]
            )
        else:
            self._run_subprocess(
                [
                    "uv",
                    "pip",
                    "install",
                    "--python",
                    str(python_exe),
                    "--no-cache",
                    str(wheel_path),
                    "pytest",
                    "responses",
                    "pdoc",
                    "openapi-spec-validator",
                ]
            )

        test_path = client_dir / "tests"
        self._run_subprocess(
            [
                str(python_exe),
                "-m",
                "pytest",
                "--import-mode=importlib",
                str(test_path),
            ]
        )

        print("\n>>> Python build and test complete. <<<")

    def _build_r_public(self, java_path):
        print(">>> Building R Public Client...")
        pkg_name = "nwfscDataCatalog"
        gen_dir = self.ROOT_DIR / "gen_r_pub"
        client_dir = self.CLIENTS_DIR / "r_public"

        shutil.rmtree(gen_dir, ignore_errors=True)
        shutil.rmtree(client_dir, ignore_errors=True)
        client_dir.mkdir(parents=True)

        cmd = [
            str(java_path),
            "-jar",
            str(self.GENERATOR_JAR),
            "generate",
            "-i",
            str(self.OPENAPI_DIR / "openapi-public.json"),
            "-g",
            "r",
            "-o",
            str(gen_dir),
            "--package-name",
            pkg_name,
        ]
        self._run_subprocess(cmd)

        shutil.copytree(gen_dir, client_dir, dirs_exist_ok=True)
        shutil.copy(self.SCRIPTS_DIR / "r" / "nwfsc_utils.R", client_dir / "R")
        shutil.copy(self.SCRIPTS_DIR / "r" / "mcp_server.R", client_dir / "R")
        shutil.copy(self.SCRIPTS_DIR / "r" / "assessment_skills.R", client_dir / "R")
        
        # Strip out redundant OpenAPI-generated github workflows
        shutil.rmtree(client_dir / ".github", ignore_errors=True)

        print(">>> Running R wrapper and documentation generators...")
        self._run_subprocess(
            [
                "Rscript",
                (self.SCRIPTS_DIR / "r" / "generate_r_wrappers.R").as_posix(),
                (self.OPENAPI_DIR / "openapi-public.json").as_posix(),
                client_dir.as_posix(),
            ]
        )
        client_dir_posix = client_dir.as_posix()

        # --- THE BULLETPROOF NAMESPACE FIX ---
        print(">>> Appending elite wrappers to NAMESPACE...")
        namespace_file = client_dir / "NAMESPACE"
        if namespace_file.exists():
            with namespace_file.open("a") as f:
                f.write("\n# --- NWFSC Elite Wrappers ---\n")
                f.write('exportPattern("^read_")\n')
                f.write('exportPattern("^fetch_all_")\n')
                f.write('export("get_sdk_metadata")\n')
                f.write('export("to_html")\n')
                f.write('export("to_json_records")\n')
                f.write('export("to_plot_img")\n')
                f.write('export("glimpse_html")\n')
                f.write('export("run_mcp_server")\n')
                f.write('export("skill_expand_compositions")\n')
                f.write('export("skill_generate_index")\n')
                f.write('export("skill_build_ss3")\n')
        # -------------------------------------

        self._run_subprocess(
            ["Rscript", "-e", f"roxygen2::roxygenize('{client_dir_posix}')"]
        )

        print(">>> Patching DESCRIPTION file robustly via 'desc'...")
        desc_path = client_dir / "DESCRIPTION"
        if desc_path.exists():
            patch_script_path = client_dir / "patch_description.R"
            r_patch_script = f"""options(repos = c(CRAN = "https://cloud.r-project.org"))
if (!requireNamespace('desc', quietly = TRUE)) {{
    install.packages('desc')
}}
d <- desc::description$new('{client_dir_posix}/DESCRIPTION')
d$del('URL')
d$del('BugReports')
d$set_dep('R6', type = 'Imports')
d$set_dep('httr', type = 'Imports')
d$set_dep('jsonlite', type = 'Imports')
d$set_dep('stringr', type = 'Imports')
d$set_dep('dplyr', type = 'Imports')
d$set_dep('tibble', type = 'Imports')
d$set_dep('magrittr', type = 'Imports')
d$set_dep('base64enc', type = 'Imports')
d$set_dep('mcptools', type = 'Suggests')
d$set_dep('ellmer', type = 'Suggests')
d$set_dep('nwfscSurvey', type = 'Suggests')
d$set_dep('sdmTMB', type = 'Suggests')
d$set_dep('r4ss', type = 'Suggests')
d$write('{client_dir_posix}/DESCRIPTION')
"""
            patch_script_path.write_text(r_patch_script, encoding="utf-8")
            self._run_subprocess(["Rscript", patch_script_path.as_posix()])
            patch_script_path.unlink(missing_ok=True)

        print(">>> Cleaning up generator files...")
        shutil.rmtree(gen_dir)
        print("\n>>> R client code generated. (Tarball build delegated to CI/CD) <<<")


def main():
    """Parses command-line arguments and executes the corresponding build action."""
    parser = argparse.ArgumentParser(description="SDK build and workspace tools.")
    subparsers = parser.add_subparsers(
        dest="command", required=True, help="Available commands"
    )

    subparsers.add_parser(
        "fetch-specs", help="Download the latest OpenAPI specification."
    )
    subparsers.add_parser("fetch-generator", help="Download the OpenAPI Generator JAR.")
    subparsers.add_parser("fetch-jdk", help="Download and set up the portable JRE.")
    subparsers.add_parser("docs-r", help="Build the R documentation site.")

    build_parser = subparsers.add_parser("build", help="Build an SDK client.")
    build_parser.add_argument(
        "--lang",
        required=True,
        help="The language of the SDK to build (e.g., 'python', 'r').",
    )
    build_parser.add_argument(
        "--scope",
        default="public",
        help="The scope of the SDK to build (e.g., 'public').",
    )

    args = parser.parse_args()
    orchestrator = BuildOrchestrator()

    if args.command == "fetch-specs":
        orchestrator.fetch_specs()
    elif args.command == "fetch-generator":
        orchestrator.fetch_generator()
    elif args.command == "fetch-jdk":
        orchestrator.bootstrap_java()
    elif args.command == "build":
        orchestrator.build_sdk(lang=args.lang, scope=args.scope)
    elif args.command == "docs-r":
        orchestrator.docs_r()


if __name__ == "__main__":
    main()
