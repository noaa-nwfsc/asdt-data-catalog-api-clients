#!/bin/bash

# Default ENV to 'test' if not provided
ENV=${1:-test}
SCOPE=$2

# Validate inputs
if [[ ! "$ENV" =~ ^(dev|test|prod)$ ]]; then
    echo "❌ Error: Invalid environment '$ENV'. Must be [dev|test|prod]"
    exit 1
fi

if [[ ! "$SCOPE" =~ ^(public|private)$ ]]; then
    echo "Usage: ./download_openapi.sh [dev|test|prod] [public|private]"
    echo "Note: ENV defaults to 'test' if omitted."
    exit 1
fi

# Configuration based on your requirements:
# Bucket naming: nwfsc-data-catalog-public-test OR nwfsc-data-catalog-private-test
BUCKET="s3://nwfsc-data-catalog-${SCOPE}-${ENV}"
if [[ "$SCOPE" == "private" ]]; then
    S3_FILE="api/v1/docs/openapi-private.json"
else
    S3_FILE="api/v1/docs/openapi.json"
fi

# Keep the local destination consistent for the generator build process
DEST="clients/${SCOPE}/openapi-${SCOPE}.json"

echo "📡 Syncing [${SCOPE}] spec from environment: [${ENV}]..."
echo "📂 Source: ${BUCKET}/${S3_FILE}"

# Execute AWS S3 Copy
aws s3 cp "${BUCKET}/${S3_FILE}" "${DEST}"

if [ $? -eq 0 ]; then
    echo "✅ Success: Spec downloaded to ${DEST}"
else
    echo "❌ Failed: Could not sync from ${BUCKET}. Check your AWS profile and bucket permissions."
    exit 1
fi

# --- R GENERATION ---
R_DEST="clients/r_${SCOPE}"
R_PKG_NAME="nwfscDataCatalog"
if [ "$SCOPE" == "private" ]; then
    R_PKG_NAME="nwfscDataCatalogPrivate"
fi

echo "📦 Running Docker Generator for R [${SCOPE}]..."
docker compose run --rm generator generate \
    -i "/local/${DEST}" \
    -g r \
    -o "/local/${R_DEST}/generated" \
    --additional-properties=packageName=${R_PKG_NAME}

# Move generated files into standard R package structure
mkdir -p "${R_DEST}/R"
cp -r ${R_DEST}/generated/R/* "${R_DEST}/R/"
cp ${R_DEST}/generated/DESCRIPTION "${R_DEST}/DESCRIPTION"
cp ${R_DEST}/generated/NAMESPACE "${R_DEST}/NAMESPACE"
rm -rf "${R_DEST}/generated"

# Inject the Elite Utils
cp shared/elite_utils.R "${R_DEST}/R/"

# Execute the R Wrapper Generator
echo "🔮 Injecting Tidyverse Wrappers..."
Rscript shared/generate_r_wrappers.R "${DEST}" "${R_DEST}/R"

# Compile Roxygen Documentation (Assumes roxygen2 is installed on runner)
echo "📚 Compiling R Documentation..."
cd "${R_DEST}"
Rscript -e "roxygen2::roxygenize()"
cd ../../