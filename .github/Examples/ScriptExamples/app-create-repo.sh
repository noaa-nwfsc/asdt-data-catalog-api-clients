#!/bin/bash

# ==============================================================================
# CONFIGURATION
# ==============================================================================
APP_ID="YOUR_APP_ID"
INSTALLATION_ID="YOUR_INSTALLATION_ID"
PEM_PATH="./your-app-private-key.pem"
ORG_NAME="your-org-name"
NEW_REPO_NAME="my-new-automated-repo"

# ==============================================================================
# 1. GENERATE JWT (Required to talk to GitHub as the App)
# ==============================================================================
generate_jwt() {
    local header=$(echo -n '{"alg":"RS256","typ":"JWT"}' | openssl base64 -e -A | tr '+/' '-_' | tr -d '=')
    local iat=$(date +%s)
    local exp=$((iat + 600)) # JWT valid for 10 minutes
    local payload=$(echo -n "{\"iat\":$iat,\"exp\":$exp,\"iss\":\"$APP_ID\"}" | openssl base64 -e -A | tr '+/' '-_' | tr -d '=')
    local signature=$(echo -n "$header.$payload" | openssl dgst -sha256 -sign "$PEM_PATH" | openssl base64 -e -A | tr '+/' '-_' | tr -d '=')
    echo "$header.$payload.$signature"
}

echo "🔑 Generating JWT..."
JWT=$(generate_jwt)

# ==============================================================================
# 2. GET INSTALLATION ACCESS TOKEN
# ==============================================================================
echo "🎫 Requesting Installation Access Token..."
INSTALL_TOKEN=$(curl -s -X POST \
  -H "Authorization: Bearer $JWT" \
  -H "Accept: application/vnd.github+json" \
  "https://api.github.com/app/installations/$INSTALLATION_ID/access_tokens" | jq -r '.token')

if [ "$INSTALL_TOKEN" == "null" ] || [ -z "$INSTALL_TOKEN" ]; then
    echo "❌ Error: Failed to obtain installation token. Check your App ID and Private Key."
    exit 1
fi

# ==============================================================================
# 3. CREATE REPOSITORY USING GH CLI
# ==============================================================================
# Export the token so the GitHub CLI uses it automatically
export GH_TOKEN="$INSTALL_TOKEN"

echo "🚀 Creating repository: $ORG_NAME/$NEW_REPO_NAME..."

gh repo create "$ORG_NAME/$NEW_REPO_NAME" \
    --private \
    --description "Created by GitHub App Automation" \
    --add-readme

if [ $? -eq 0 ]; then
    echo "✅ Success! Repo created by $APP_ID [bot]."
else
    echo "❌ Failed to create repository."
fi
