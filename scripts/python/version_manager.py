# scripts/python/version_manager.py
import hashlib
import re
import sys
from pathlib import Path

ROOT_DIR = Path(__file__).parent.parent.parent.resolve()
SPEC_PATH = ROOT_DIR / "openapi" / "openapi-public.json"
HASH_PATH = ROOT_DIR / ".spec_hash"
PYPROJECT_PATH = ROOT_DIR / "clients" / "python_public" / "pyproject.toml"
R_DESCRIPTION_PATH = ROOT_DIR / "clients" / "r_public" / "DESCRIPTION"
TS_PACKAGE_PATH = ROOT_DIR / "clients" / "typescript_public" / "package.json"


def get_spec_hash():
    """Calculates the SHA256 hash of the OpenAPI spec file."""
    if not SPEC_PATH.exists():
        return None
    with open(SPEC_PATH, "rb") as f:
        return hashlib.sha256(f.read()).hexdigest()


def read_stored_hash():
    """Reads the previously stored hash from the .spec_hash file."""
    if not HASH_PATH.exists():
        return None
    return HASH_PATH.read_text().strip()


def write_stored_hash(new_hash):
    """Writes the new hash to the .spec_hash file."""
    HASH_PATH.write_text(new_hash)
    print(f"Updated spec hash to: {new_hash[:12]}")


def increment_patch_version(version_string):
    """Increments the patch component of a semantic version string."""
    parts = version_string.split(".")
    try:
        parts[2] = str(int(parts[2]) + 1)
        return ".".join(parts)
    except (IndexError, ValueError) as e:
        print(
            f"Could not parse version string '{version_string}': {e}", file=sys.stderr
        )
        return None


def update_python_version():
    """Reads, increments, and writes back the version in pyproject.toml."""
    if not PYPROJECT_PATH.exists():
        print(f"Warning: {PYPROJECT_PATH} not found. Skipping Python version update.")
        return

    content = PYPROJECT_PATH.read_text()
    match = re.search(r'version\s*=\s*"(\d+\.\d+\.\d+)"', content)

    if not match:
        print("Could not find version string in pyproject.toml", file=sys.stderr)
        return

    old_version = match.group(1)
    new_version = increment_patch_version(old_version)

    if new_version:
        print(f"Bumping Python version: {old_version} -> {new_version}")
        new_content = content.replace(
            f'version = "{old_version}"', f'version = "{new_version}"'
        )
        PYPROJECT_PATH.write_text(new_content)


def update_r_version():
    """Reads, increments, and writes back the version in DESCRIPTION."""
    if not R_DESCRIPTION_PATH.exists():
        print(f"Warning: {R_DESCRIPTION_PATH} not found. Skipping R version update.")
        return

    content = R_DESCRIPTION_PATH.read_text()
    match = re.search(r"Version:\s*(\d+\.\d+\.\d+)", content)

    if not match:
        print("Could not find version string in DESCRIPTION", file=sys.stderr)
        return

    old_version = match.group(1)
    new_version = increment_patch_version(old_version)

    if new_version:
        print(f"Bumping R version: {old_version} -> {new_version}")
        new_content = content.replace(
            f"Version: {old_version}", f"Version: {new_version}"
        )
        R_DESCRIPTION_PATH.write_text(new_content)


def update_typescript_version():
    """Reads, increments, and writes back the version in package.json."""
    if not TS_PACKAGE_PATH.exists():
        print(f"Warning: {TS_PACKAGE_PATH} not found. Skipping TypeScript version update.")
        return

    content = TS_PACKAGE_PATH.read_text(encoding="utf-8")
    match = re.search(r'"version"\s*:\s*"(\d+\.\d+\.\d+)"', content)

    if not match:
        print("Could not find version string in package.json", file=sys.stderr)
        return

    old_version = match.group(1)
    new_version = increment_patch_version(old_version)

    if new_version:
        print(f"Bumping TypeScript version: {old_version} -> {new_version}")
        new_content = content.replace(
            f'"version": "{old_version}"', f'"version": "{new_version}"'
        )
        TS_PACKAGE_PATH.write_text(new_content, encoding="utf-8")


def main():
    """Main function to check for spec changes and trigger version bumps."""
    print("--- Version Manager: Checking for spec updates... ---")
    current_hash = get_spec_hash()
    if not current_hash:
        print(
            "Could not calculate current spec hash. Has 'fetch-specs' been run?",
            file=sys.stderr,
        )
        return

    stored_hash = read_stored_hash()

    if current_hash != stored_hash:
        print("Change in OpenAPI spec detected. Bumping patch versions.")
        update_python_version()
        update_r_version()
        update_typescript_version()
        write_stored_hash(current_hash)
    else:
        print("No spec changes detected. Versions remain unchanged.")


if __name__ == "__main__":
    main()
