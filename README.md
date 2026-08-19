**NOTE: SDKs and the NWFSC Data Catalog is in pre-release and actively being developed for first release**

# NWFSC Data Catalog R, Python & TypeScript SDKs

This repository contains the source code and build system for the **NWFSC Data Catalog SDKs**, available for Python, R, and TypeScript. The entire build process is orchestrated through a Python script, requires no containerization (like Docker), and automatically bootstraps its own Java runtime, Pandoc toolchain, and npm modules to remain portable and dependency-free.

## Quick Start

### Python Installation

#### Using standard pip:
```bash
pip install https://github.com/noaa-nwfsc/asdt-data-catalog-api-clients/releases/download/v0.1.11/nwfsc_data_catalog-0.1.11-py3-none-any.whl
```

#### Using uv:
```bash
uv pip install https://github.com/noaa-nwfsc/asdt-data-catalog-api-clients/releases/download/v0.1.11/nwfsc_data_catalog-0.1.11-py3-none-any.whl
```

### R Installation
```r
# Install pak if missing
if (!requireNamespace("pak", quietly = TRUE)) install.packages("pak")
# Install the SDK (pak automatically resolves dependencies from CRAN)
pak::pkg_install("url::https://github.com/noaa-nwfsc/asdt-data-catalog-api-clients/releases/latest/download/nwfscDataCatalog-latest.tar.gz")
```

### TypeScript / JavaScript Installation
```bash
npm install https://github.com/noaa-nwfsc/asdt-data-catalog-api-clients/releases/latest/download/nwfsc-data-catalog-client-latest.tgz
```
---

## Repository Structure

- **/clients**: Contains the source code for the individual language-specific SDKs.
  - `/python_public`: The public Python SDK package.
  - `/r_public`: The public R SDK package.
  - `/typescript_public`: The public TypeScript SDK package (targets browsers/Node.js).
- **/openapi**: Stores the `openapi-public.json` specification file, which is the single source of truth for all code generation.
- **/scripts**: Home for all build and automation logic.
  - `/python/build_tools.py`: The primary build orchestrator.
  - `/python/version_manager.py`: Automatically bumps package versions when the OpenAPI spec changes.
  - `/r/`: Contains wrapper generation logic for the R package.
- **Makefile**: A simple, cross-platform frontend for the build system.

---

## Updating the API Specification (GitOps Workflow)

This repository follows a strict **GitOps (Spec-Driven Development)** model. The CI/CD pipeline does **not** dynamically fetch the live OpenAPI specification from the server; it relies exclusively on the `openapi.json` file that is checked into version control.

To update the API clients, developers must follow these steps:

1. **Connect to the NOAA VPN**: You must be on the VPN to access the internal API endpoint that serves the live specification.
2. **Fetch the Latest Spec**: Run the following command from the repository root:
   ```bash
   make fetch-public-spec
   ```
3. **Review the Diff**: Use `git diff openapi/openapi-public.json` to carefully review changes (e.g., new endpoints, updated parameters).
4. **Verify Version Bump**: The build orchestrator will automatically detect the spec change and increment the package version in `clients/python_public/pyproject.toml` and `clients/typescript_public/package.json`.
5. **Commit and Open a Pull Request**:
   ```bash
   git add openapi/openapi-public.json clients/python_public/pyproject.toml clients/typescript_public/package.json
   git commit -m "feat: Update API spec to include new endpoints"
   ```
   Open a Pull Request to merge your changes into the `main` or `develop` branch.
6. **Merge to Trigger Release**: Once merged, the GitHub Actions pipeline will automatically:
   - Generate the new client code from the updated spec.
   - Build, test, and compile the Python, R, and TypeScript packages.
   - Create a new GitHub Release tagged with the new version number.
   - Upload the `.whl`, `.tar.gz`, and `.tgz` packages as release assets.
   - Deploy the updated documentation to GitHub Pages.

---

## Local Development & Building

The build system is designed to be simple and portable. You only need `uv` (a fast Python package manager), `R` (a modern version installed), and `Node.js` (with `npm`).

### Prerequisites

1. **uv**: [Install from astral.sh](https://github.com/astral-sh/uv)
2. **R**: [Install from CRAN](https://cran.r-project.org/)
3. **Node.js & npm**: [Install from nodejs.org](https://nodejs.org/)

### Makefile Menu

All common tasks are handled by the root `Makefile`.

| Command | Description |
| :--- | :--- |
| `make all` | **(Default)** Builds all SDKs (Python, R, and TypeScript). |
| `make build-python-public` | Builds and tests only the public Python SDK. |
| `make build-r-public` | Builds only the public R SDK. |
| `make build-ts-public` | Builds and compiles only the public TypeScript SDK. |
| | |
| `make fetch-public-spec` | Downloads the latest `openapi.json` from the server. |
| `make fetch-jdk` | Downloads a portable Java 17 JRE. Run automatically as needed. |
| `make fetch-generator` | Downloads the `openapi-generator-cli.jar`. Run automatically as needed. |
| | |
| `make docs` | Generates static HTML documentation for all clients. |
| `make docs-python` | Generates Python docs using `Sphinx`. |
| `make docs-r` | Generates R docs using `pkgdown`. |
| | |
| `make setup-hooks` | Configures local `pre-commit` Git hooks for Gitleaks security scans. |
| `make gitleaks-precommit` | Runs `pre-commit` checks (including Gitleaks) across all repository files. |
| `make security-scan` | Executes a deep, verbose Gitleaks scan on the working tree. |

---

## CI/CD Pipeline & Automated Releases

This project features a fully automated, unified CI/CD workflow (`ci-cd.yml`) that strictly gates deployments and releases using a GitOps model. The pipeline operates in three distinct phases depending on the branch:

1. **Continuous Integration (PR Phase)**: On every Pull Request, the pipeline provisions clean `uv`, `R`, and `Node.js` environments, bootstraps Java, reads the checked-in `openapi-public.json` spec, generates the client source code, and builds the artifacts. This acts as a security gate to ensure broken code or invalid specs never merge.
2. **Continuous Deployment (Merge to `develop`)**: When code is successfully merged into `develop`, the pipeline rebuilds the artifacts and securely deploys the static Python (`Sphinx`) and R (`pkgdown`) documentation sites directly to GitHub Pages.
3. **Automated Release (Merge to `main`)**: When code is ready for production and merges into `main`, the pipeline extracts the newly incremented SDK version from `pyproject.toml`, authors a new GitHub Release (e.g., `v1.2.3`), and uploads the `.whl`, `.tar.gz`, and `.tgz` packages. It also automatically generates `-latest` file aliases so standard installation links never break.

## WebAssembly (WebR & Pyodide) Architecture

This SDK is specifically engineered to run seamlessly across standard desktop environments as well as browser-based WebAssembly (via Pyodide and WebR), powering our interactive API Coding Lab.

---

## Documentation & GitHub Pages

Static documentation sites are built on every pipeline execution and deployed directly to **GitHub Pages**.

View the live documentation landing page at:
**`https://noaa-nwfsc.github.io/asdt-data-catalog-api-clients/`**

---

## Usage Examples

### Python Example
```python
from nwfsc_data_catalog import DataCatalog

# Initialize the catalog
catalog = DataCatalog()

# Fetch all available survey years from the bottom trawl survey
survey_years_df = catalog.read_bottom_trawl_survey_years()
print(survey_years_df)

# Fetch vessels used in the bottom trawl survey for a specific year
vessels_df = catalog.read_bottom_trawl_vessels(year=2023)
print(vessels_df.head())
```

### R Example
```r
# Load the library
library(nwfscDataCatalog)

# Fetch all available survey years from the bottom trawl survey
survey_years_df <- read_bottom_trawl_survey_years()
print(head(survey_years_df))

# Fetch vessels used in the bottom trawl survey for a specific year
vessels_df <- read_bottom_trawl_vessels(year = 2023)
print(head(vessels_df))

# Use a UI utility to convert a dataframe to a styled HTML table
html_output <- to_html(vessels_df)
```

### TypeScript / JavaScript Example
```typescript
import { NWFSCDataCatalog } from '@nwfsc/data-catalog-client';

// Initialize the ergonomic client
const catalog = new NWFSCDataCatalog();

// Fetch vessels used in the bottom trawl survey for 2023
catalog.getBottomTrawlVessels({ year: 2023 })
  .then(vessels => {
    console.log('Vessels:', vessels);
  });

// Auto-paginate all available survey years dynamically
catalog.fetch_all_bottom_trawl_survey_years()
  .then(allYears => {
    console.log('All survey years:', allYears);
  });
```

---

## Model Context Protocol (MCP) Servers

The NWFSC Data Catalog provides built-in **Model Context Protocol (MCP)** servers for both Python and R. Developers can hook these servers into local AI environments (like Claude Desktop or Cursor) to allow large language models to securely pull catalog data and run advanced fisheries biometrics analyses.

### Running the Python MCP Server
The Python SDK registers a console script entry point upon installation. You can launch the server using the official MCP Inspector or hook it directly into an AI app using `stdio`:
```bash
npx @modelcontextprotocol/inspector nwfsc-data-catalog-mcp
```

### Running the R MCP Server (w/ Stock Assessment Skills)
The R SDK exposes the exact same dataset catalog alongside advanced fisheries stock assessment capabilities using standard R biometrics packages (`sdmTMB`, `nwfscSurvey`, `r4ss`). 
```bash
npx @modelcontextprotocol/inspector Rscript -e "nwfscDataCatalog::run_mcp_server()"
```

---

## Maintainers / Contact
* **Primary Contact:** Jim Fellows (james.fellows@noaa.gov)
* **Team:** At-Sea Data Team (ASDT)

---

## Disclaimer

This repository is a scientific product and is not official communication of the National Oceanic and Atmospheric Administration, or the United States Department of Commerce. All NOAA GitHub project content is provided on an "as is" basis and the user assumes responsibility for its use. Any claims against the Department of Commerce or Department of Commerce bureaus stemming from the use of this GitHub project will be governed by all applicable Federal law. Any reference to specific commercial products, processes, or services by service mark, trademark, manufacturer, or otherwise, does not constitute or imply their endorsement, recommendation or favoring by the Department of Commerce. The Department of Commerce seal and logo, or the seal and logo of a DOC bureau, shall not be used in any manner to imply endorsement of any commercial product or activity by DOC or the United States Government.