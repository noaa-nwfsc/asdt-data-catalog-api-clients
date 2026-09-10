# Makefile
# This file serves as a simple, cross-platform entry point for the build system.
# The complex logic is delegated to the Python build script.

# --- 1. OS DETECTION & ENVIRONMENT SETUP ---

# Load local environment variables if .env.local exists
-include .env.local

# Export variables so subprocesses (like 'gemini') can read them
export GOOGLE_CLOUD_PROJECT

# Virtual Environment Python Binary Selection
VENV_PYTHON := clients/python_public/.venv/bin/python
ifeq ($(OS),Windows_NT)
    VENV_PYTHON := clients/python_public/.venv/Scripts/python.exe
endif

# Declare all non-file targets to prevent Makefile target name collisions
.PHONY: all build-all build-python-public build-r-public build-ts-public \
        fetch-public-spec fetch-generator fetch-jdk \
        docs docs-python docs-r \
        gemini setup-hooks security-scan gitleaks-precommit

# --- 2. MAIN BUILD TARGETS ---

# Default target
all: build-all

# Build all supported SDKs sequentially
build-all: build-python-public build-r-public build-ts-public

# Downloads the latest OpenAPI specification
fetch-public-spec:
	uv run python scripts/python/build_tools.py fetch-specs

# Downloads the OpenAPI Generator JAR if it doesn't exist
fetch-generator:
	uv run python scripts/python/build_tools.py fetch-generator

# Downloads and unpacks the portable JRE if it doesn't exist
fetch-jdk:
	uv run python scripts/python/build_tools.py fetch-jdk

# Builds and tests the public Python client
build-python-public:
	uv run python scripts/python/build_tools.py build --lang python --scope public

# Builds the public R client
build-r-public:
	uv run python scripts/python/build_tools.py build --lang r --scope public

# Builds the public TypeScript client
build-ts-public:
	uv run python scripts/python/build_tools.py build --lang typescript --scope public

# --- 3. DOCUMENTATION TARGETS ---

docs: docs-python docs-r

# Generate static HTML documentation for the Python client
docs-python:
	cd clients/python_public && uv run sphinx-apidoc -f -o sphinx_docs/ src/nwfsc_data_catalog/ --separate --module-first
	cd clients/python_public && uv run sphinx-build -b html sphinx_docs/ ../../docs/python/

# Generate static HTML documentation for the R client
docs-r:
	uv run python scripts/python/build_tools.py docs-r

# --- 4. UTILITIES & SECURITY SCANNING ---

# Uses global project env var exported above
gemini:
	gemini

# One-time setup to register pre-commit hooks locally
setup-hooks:
	uv run pre-commit install

# Runs pre-commit checks (including Gitleaks) across all files
gitleaks-precommit:
	uv run pre-commit run --all-files

# Runs an explicit, verbose Gitleaks scan on the whole repository working tree
security-scan:
	gitleaks detect --verbose