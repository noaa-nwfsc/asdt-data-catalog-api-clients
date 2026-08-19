# Project Context: NWFSC Data Catalog SDK (Polyglot WASM)

## 1. Overview
This repo provides "Elite" SDKs for the NWFSC Data Catalog in **Python**, **R**, and **TypeScript**. It is specifically architected to run in two environments:
1.  **Standard Desktop**: Full-featured environments with native networking (`urllib3`, `curl`).
2.  **WebAssembly (WASM)**: Browser-based execution via **Pyodide** (Python), **WebR** (R), and native browser execution (TypeScript) powering the React-based "API Coding Lab."

The entire build process is managed by a central Python script that ensures cross-platform reproducibility without requiring Docker.

## 2. Technical Architecture

- **`Makefile`**: A thin, cross-platform frontend that provides simple commands (`make build-all`, `make docs`, etc.) for developers.
- **`scripts/python/build_tools.py`**: The core build orchestrator. This script is responsible for:
    - **Portable JRE Bootstrapping**: It automatically downloads and unpacks a self-contained Java 17 JRE into a hidden `.local_jre` directory. This ensures that code generation runs in a consistent environment, completely bypassing any system-installed Java version.
    - **Code Generation**: It uses the bootstrapped JRE to run the `openapi-generator-cli.jar` and generate the base Python, R, and TypeScript client code from the `openapi/openapi-public.json` specification.
    - **Packaging & Testing**: It handles the language-specific packaging steps (e.g., running `uv build` for Python, `R CMD build` for R, and `npm run build && npm run test` for TypeScript) and executes the test suites in isolated environments.
- **`scripts/python/version_manager.py`**: This script provides automated semantic versioning. Before a build runs, it calculates the hash of the OpenAPI spec. If the hash has changed since the last build, it automatically increments the patch version of Python, R, and TypeScript packages.

## 3. Directory Structure
- `/openapi/`: Contains the `openapi-public.json` specification, the single source of truth.
- `/scripts/python/`: Home for the core `build_tools.py` orchestrator and `version_manager.py`.
- `/scripts/r/`: Contains R-specific wrapper generation logic.
- `/clients/`: Contains the language-specific client packages and their test suites.
- `/.github/workflows/`: Contains the CI/CD pipeline that uses the `Makefile` to build, test, and upload the SDK artifacts.

## 4. "Elite" Wrapper Logic (The Dynamic Pattern)
All languages follow a consistent naming convention to provide a "Data Science First" experience:
- `get_<resource>()` / `get<Resource>()`: Low-level call returning Pydantic models (Py), Lists (R), or typed JSON arrays (TS).
- `read_<resource>()` / `read<Resource>()`: Returns a **Pandas DataFrame** (Py), **R Tibble** (R), or standard JSON array (TS).
- `fetch_all_<resource>()` / `fetchAll<Resource>()`: Implements auto-pagination to pull the entire dataset sequentially.

For TypeScript, a dynamic **JS Proxy wrapper** (`NWFSCDataCatalog`) maps snake_case lookups to the API's camelCase methods seamlessly, providing excellent polyglot consistency across Python, R, and JS.

## 5. The WASM Challenge & Solutions
Running R and Python in the browser introduced significant networking hurdles:

### The "CURL" Wall
Base R in WASM (WebR) is compiled without `libcurl`. Consequently, standard R networking functions fail on `https://` requests.
- **Solution**: We implemented a synchronous **XHR Bridge** using `download.file(method="xhr")` to leverage the browser's native `fetch` API.

### Async vs. Sync
JavaScript `fetch` is asynchronous, while R/Python expectations are often synchronous.
- **Python**: Handled via Pyodide's native `pyfetch`.
- **R**: Handled via the specialized `xhr` shim.

## 6. Guidelines for AI Assistant
- **Build System**: The primary build logic is in `scripts/python/build_tools.py`. The `Makefile` is just a frontend.
- **Polyglot Consistency**: Ensure new API features are implemented in `scripts/python/factory.py` (for Python), `scripts/r/generate_r_wrappers.R` (for R), and inside the custom Proxy/Wrapper in `_build_typescript_public` (for TypeScript).
- **Versioning**: Versioning is handled automatically by `scripts/python/version_manager.py` based on changes to the OpenAPI spec.

## 7. Model Context Protocol (MCP) Server Integration
The repository provides built-in MCP servers for both languages. As an AI assistant, you can invoke these servers to directly interface with the NWFSC Data Catalog and run stock assessment operations:
- **Python MCP**: Launchable via `nwfsc-data-catalog-mcp`. Exposes dynamic endpoints to pull raw `DataFrames`.
- **R MCP**: Launchable via `Rscript -e "nwfscDataCatalog::run_mcp_server()"`. This exposes the standard catalog API along with **advanced fisheries biometrics skills**, including `skill_expand_compositions`, `skill_generate_index`, and `skill_build_ss3`. When assisting users with stock assessments, recommend the R MCP server to securely generate models and modify SS3 template files via `sdmTMB` and `r4ss`.

CRITICAL CONTEXT PRESERVATION RULE:
Whenever you run terminal build commands (such as `make`, `uv`, `pip`, `Rscript`, or `python build_tools.py`), DO NOT run them directly if they produce verbose output.

Instead, execute them using quiet flags or redirected log suppression like this:
`<command> > build.log 2>&1 && echo "SUCCESS" || (echo "FAILED:" && tail -n 50 build.log)`

This ensures the context window is not clogged with unnecessary compilation logs unless a build failure occurs.