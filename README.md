# NWFSC Data Catalog R & Python SDKs

This repository contains the source code and build system for the **NWFSC Data Catalog SDKs**, available for both Python and R. The entire build process is orchestrated through a Python script, requires no containerization (like Docker), and automatically bootstraps its own Java runtime and Pandoc toolchain to remain portable and dependency-free.

## Quick Start

### Python Installation
```bash
# Using standard pip
pip install [https://github.com/noaa-nwfsc/asdt-data-catalog-api-clients/releases/download/v0.1.3/nwfsc_data_catalog-0.1.3-py3-none-any.whl](https://github.com/noaa-nwfsc/asdt-data-catalog-api-clients/releases/download/v0.1.3/nwfsc_data_catalog-0.1.3-py3-none-any.whl)

# Using uv
uv pip install [https://github.com/noaa-nwfsc/asdt-data-catalog-api-clients/releases/download/v0.1.3/nwfsc_data_catalog-0.1.3-py3-none-any.whl](https://github.com/noaa-nwfsc/asdt-data-catalog-api-clients/releases/download/v0.1.3/nwfsc_data_catalog-0.1.3-py3-none-any.whl)
```

### R Installation
```r
# Install directly from the latest Release asset URL
install.packages(
  "[https://github.com/noaa-nwfsc/asdt-data-catalog-api-clients/releases/download/v0.1.3/nwfscDataCatalog_1.0.0.tar.gz](https://github.com/noaa-nwfsc/asdt-data-catalog-api-clients/releases/download/v0.1.3/nwfscDataCatalog_1.0.0.tar.gz)", 
  repos = NULL, 
  type = "source"
)
```

---

## Repository Structure

- **/clients**: Contains the source code for the individual language-specific SDKs.
  - `/python_public`: The public Python SDK package.
  - `/r_public`: The public R SDK package.
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
4. **Verify Version Bump**: The build orchestrator will automatically detect the spec change and increment the package version in `clients/python_public/pyproject.toml`.
5. **Commit and Open a Pull Request**:
   ```bash
   git add openapi/openapi-public.json clients/python_public/pyproject.toml
   git commit -m "feat: Update API spec to include new endpoints"
   ```
   Open a Pull Request to merge your changes into the `main` or `develop` branch.
6. **Merge to Trigger Release**: Once merged, the GitHub Actions pipeline will automatically:
   - Generate the new client code from the updated spec.
   - Build, test, and compile the Python and R packages.
   - Create a new GitHub Release tagged with the new version number.
   - Upload the `.whl` and `.tar.gz` packages as release assets.
   - Deploy the updated documentation to GitHub Pages.

---

## Local Development & Building

The build system is designed to be simple and portable. You only need `uv` (a fast Python package manager) and a modern version of `R` installed on your system.

### Prerequisites

1. **uv**: [Install from astral.sh](https://github.com/astral-sh/uv)
2. **R**: [Install from CRAN](https://cran.r-project.org/)

### Makefile Menu

All common tasks are handled by the root `Makefile`.

| Command | Description |
| :--- | :--- |
| `make all` | **(Default)** Builds all SDKs (Python and R). |
| `make build-python-public` | Builds and tests only the public Python SDK. |
| `make build-r-public` | Builds only the public R SDK. |
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
| `make lint` | Runs `pre-commit` checks (including Gitleaks) across all repository files. |
| `make security-scan` | Executes a deep, verbose Gitleaks scan on the working tree. |

---

## CI/CD Pipeline & GitHub Releases

This project features a fully automated release workflow (`docs-deployment.yml`) triggered on every commit to the `main` or `develop` branches (as well as manually via `workflow_dispatch`).

The pipeline operates in a clean environment as follows:
1. **Environment Setup**: Configures standard `uv` and `R` environments, then installs pre-compiled binary packages for `roxygen2` and `pkgdown`.
2. **API Client Generation**: Runs `make build-all` which bootstraps Java, reads the `openapi/openapi-public.json` spec, and generates clean client source code libraries.
3. **Documentation Site Generation**: Executes `make docs` to build high-quality reference guides.
4. **Compiling Packages**: Compiles the Python source into a portable Wheel (`.whl`) and R source into a package tarball (`.tar.gz`).
5. **Automatic Release Management**: Automatically extracts the SDK version from `pyproject.toml`. If the version has incremented, it:
   - Creates a new GitHub Release with the tag `vX.Y.Z`.
   - Uploads the Python Wheel and R Tarball as release assets.

---

## Documentation & GitHub Pages

Static documentation sites are built on every pipeline execution and deployed directly to **GitHub Pages**.

- **Python Documentation**: Generated using `Sphinx`, producing a clean, structured API reference guide.
- **R Documentation**: Generated using `pkgdown`, featuring organized sections configured in `_pkgdown.yml`.

### Accessing the Docs
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

---

## Maintainers / Contact
* **Primary Contact:** Jim Fellows (james.fellows@noaa.gov)
* **Team:** At-Sea Data Team (ASDT)

---

## Disclaimer

This repository is a scientific product and is not official communication of the National Oceanic and Atmospheric Administration, or the United States Department of Commerce. All NOAA GitHub project content is provided on an "as is" basis and the user assumes responsibility for its use. Any claims against the Department of Commerce or Department of Commerce bureaus stemming from the use of this GitHub project will be governed by all applicable Federal law. Any reference to specific commercial products, processes, or services by service mark, trademark, manufacturer, or otherwise, does not constitute or imply their endorsement, recommendation or favoring by the Department of Commerce. The Department of Commerce seal and logo, or the seal and logo of a DOC bureau, shall not be used in any manner to imply endorsement of any commercial product or activity by DOC or the United States Government.