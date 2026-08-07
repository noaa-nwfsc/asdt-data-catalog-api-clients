#!/bin/bash
#.github/scripts/setup-repo.sh
set -e

echo "Starting repository configuration..."
echo "Template: $TEMPLATE_REPO"
echo "New Repo: $NEW_REPO"
OLD_ORG="${OLD_REPO%%/*}"
OLD_REPO_BASE=${OLD_REPO##*/}
NEW_ORG="${NEW_REPO%%/*}"
NEW_REPO_BASE=${NEW_REPO##*/}

# 1. Copy Teams and Permissions
echo "Copying Teams..."
gh api repos/$TEMPLATE_REPO/teams > teams.json
jq -c '.[]' teams.json | while read -r team; do
  slug=$(echo "$team" | jq -r '.slug')
  permission=$(echo "$team" | jq -r '.permission')
  echo "  Adding team: $slug with permission: $permission"
  
  # API call to add team to the new repo
  #    repos/$NEW_REPO/teams/$slug \
  gh api --method PUT -H "Accept: application/vnd.github+json" \
	 orgs/$NEW_ORG/teams/$SLUG/repos/$NEW_REPO \
    -f permission="$permission" || echo "  Warning: Failed to add team $slug. Verify token has Org Members Read access."
done
# Conflict with Teams?
#--# 2. Copy Collaborators and Permissions
#--echo "Copying Collaborators..."
#--# Getting direct collaborators (excluding outside collaborators if needed, but standard endpoint is fine)
#--gh api repos/$TEMPLATE_REPO/collaborators > collabs.json
#--jq -c '.[]' collabs.json | while read -r collab; do
#--  login=$(echo "$collab" | jq -r '.login')
#--  role=$(echo "$collab" | jq -r '.role_name')
#--  
#--  # Skip the bot/user running the script to prevent locking oneself out
#--  if [[ "$login" == *"bot"* ]]; then
#--    continue
#--  fi
#--
#--  echo "  Adding collaborator: $login with role: $role"
#--  gh api --method PUT -H "Accept: application/vnd.github+json" \
#--    repos/$NEW_REPO/collaborators/$login \
#--    -f permission="$role" || echo "  Warning: Failed to add $login."
#--done

# ... (Previous script logic: Step 1 Teams and Step 2 Collaborators) ...

# ==========================================
# 2.5 SELF-DESTRUCT COMMIT (Do this BEFORE rulesets!)
# ==========================================
echo "Committing self-destruct before locking down the branch..."
git config --global user.name "github-actions[bot]"
git config --global user.email "github-actions[bot]@users.noreply.github.com"

# Remove the initialization files
git rm .github/workflows/init-repo.yml
git rm .github/scripts/setup-repo.sh

# Commit and push using the default GITHUB_TOKEN configured by actions/checkout
git commit -m "chore: remove repository initialization scripts [skip ci]"
git push || echo "::warning::Failed to push self-destruct commit. Branch may already be protected."

# ==========================================
# 3. Copy Rulesets (Now we lock the door)
# ==========================================
echo "Copying Rulesets..."
gh api repos/$TEMPLATE_REPO/rulesets > rulesets.json
jq -c '.[]' rulesets.json | while read -r ruleset_summary; do
  id=$(echo "$ruleset_summary" | jq -r '.id')
  
  # Fetch the full ruleset configuration
  gh api repos/$TEMPLATE_REPO/rulesets/$id > rule_$id.json
  
  # Strip out template-specific metadata before POSTing to the new repo
  jq 'del(.id, .node_id, .created_at, .updated_at, ._links)' rule_$id.json > payload_$id.json
  
  name=$(jq -r '.name' payload_$id.json)
  echo "  Applying ruleset: $name"
  
  gh api --method POST -H "Accept: application/vnd.github+json" \
    repos/$NEW_REPO/rulesets \
    --input payload_$id.json || echo "  Warning: Failed to apply ruleset $name."
done

echo "Configuration complete!"
