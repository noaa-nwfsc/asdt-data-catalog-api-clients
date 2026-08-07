#!/usr/bin/env /bin/bash
SCRIPT_NAME=$(basename $0)
SCRIPT_DIR=$(dirname $(realpath $0))

usage(){
	echo -e "Usage:\t$SCRIPT_NAME [--token TOKEN] [--template <TEMPLATE_REPO>] [--new_repo <NEW_REPO>]"
	echo -e "  Create repo <ORG_NAME>/<NEW_REPO> from <ORG_NAME>/<TEMPLATE_REPO>."
	echo -e "  All rules, groups and users are copied over."
	echo
	echo -e "  Required arguments:"
	echo -e "\tORG_NAME: Github organization in which both template and new repository"
	echo -e "\t          reside."
	echo -e "\tTEMPATE_REPO: Name of github repository used as template."
	echo -e "\tNEW_REPO: Name of new repo."
	echo -e "   Options:"
	echo -e "\t--token TOKEN: The github token to use in authenticating."
	echo -e "\t           If not set, script uses environment varable GITHUB_TOKEN."
	echo -e "\t           If neither option nor environment variable is set"
	echo -e "\t           script will abort"

	
}

while [ $# -ne 0 ]; do
   	  case "$1" in
		  -h|--help)
			  usage
			  exit
			  ;;
		  --token)
			  shift
			  GITHUB_TOKEN=$1
			  shift
			  ;;
		  --)
			  echo "Aborting: Invalid option '$1'" 1>&2
			  usage 1>&2
			  exit 1
			  ;;
		  *)
			  ;;
	  esac
done

if [ $# -eq 0 ];then
	usage
	exit 0
elif [ $# -ne 3 ];then
	echo "Aborting: missing required arguments." 1>&2
	usage 1>&2
	exit 1
fi
GITHUB_ORG="$1"
TEMPLATE_REPO="$2"
NEW_REPO="$3"

echo " Creating $NEW_REPO from template $TEMPLATE_REPO..."

# 1. Create RepoB from RepoA
gh repo create "$GITHUB_ORG/$NEW_REPO" --template "$GITHUB_ORG/$TEMPLATE_REPO" --public # or --private

# 2. Sync Team Permissions
echo " Syncing team permissions..."
TEAMS=$(gh api "repos/$GITHUB_ORG/$TEMPLATE_REPO/teams" --jq '.[] | {slug: .slug, permission: .permission}')

for team in $(echo "$TEAMS" | jq -c '.'); do
    SLUG=$(echo $team | jq -r '.slug')
    PERM=$(echo $team | jq -r '.permission')
    
    echo gh api --method PUT "orgs/$GITHUB_ORG/teams/$SLUG/repos/$GITHUB_ORG/$NEW_REPO" -f "permission=$PERM" --silent
done

# 3. Sync Repository Rulesets
# Note: Rulesets are the modern way to handle branch protection.
echo "Copying Repository Rulesets..."
RULESETS=$(gh api "repos/$GITHUB_ORG/$TEMPLATE_REPO/rulesets" --jq '.[].id')

for RULE_ID in $RULESETS; do
    # Get rule details (excluding ID and links)
    RULE_DATA=$(gh api "repos/$GITHUB_ORG/$TEMPLATE_REPO/rulesets/$RULE_ID" \
                --jq 'del(.id, .node_id, ._links, .created_at, .updated_at)')
    
    # Apply to new repo
    echo "$RULE_DATA" \| gh api --method POST "repos/$GITHUB_ORG/$NEW_REPO/rulesets" --input - --silent
done

# 4. Get individual collaborators
echo "👥 Fetching and adding individual collaborators..."
# Fetch direct collaborators and their permissions
COLLABS=$(gh api repos/$GITHUB_ORG/$TEMPLATE_REPO/collaborators?affiliation=direct --jq '.[] | {login:.login, role_name:.role_name}')
for collab in $(echo $COLLABS|jq -c '.');do
	login=$(echo $collab | jq -r '.login')
    role=$(echo $collab | jq -r '.rolename')
    echo "Adding user: $login as $role"
echo     gh api --method PUT "repos/$GITHUB_ORG/$NEW_REPO/collaborators/$login" -f "permission=$role" --silent 
done

echo "Done! Repo $NEW_REPO is ready."
