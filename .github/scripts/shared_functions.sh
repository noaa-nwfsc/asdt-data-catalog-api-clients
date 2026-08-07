#!/usr/bin/env /bin/bash
trap 'rm -f -r .ruleset.*.json .targ.*.repo .src.*.rep' HUP EXIT  SIGINT INT

export VERBOSE="${VERBOSE:-0}"
export QUIET="${QUIET:-0}"
if [ $VERBOSE -ne 0 ];then	export QUIET=0;fi

# Shared functions for github tools.

abort(){
	echo -e "Aborting: $1" 1>&2
	if [ "$2" ];then
		echo -e "Details:" 1>&2
		echo -e "$2" |sed 's+^+\t+' 1>&2
	fi
			 
	exit 1
}
	

cmdAbort(){

	#	error "Aborting: Cannot get teams data with:.\n\tCMD: $CMD\nOutp[:\n$DATA" 1>&2
	echo -n "Aborting: " 1>&2
	if [ "$1" != "" ];then
		echo -n "$1" 1>&2
		shift
	fi
	if [ "$1" != "" ];then
		echo -n "\n   CMD: $2" 1>&2
		shift
	fi
	if [ "$*" != "" ];then
		echo -n "\n   Error Messages:\n $(echo $*|sed 's+^+\t++') " 1>&2
	fi
	echo 1>&2
	exit 1
}

verify_token(){
	if [ "$GH_TOKEN" = "" ];then
		echo "verify_token: GH_TOKEN is not defined" 1>&2
		return 1
	fi
	CMD="gh api user -i"
	if [ $VERBOSE -ne 0 ];then
		echo "verify_token: Executing $CMD" 1>&2
	fi
	if  ! LOG="$(eval $CMD 2>&1)"; then
		echo -e "verify_token: Cannot verify token  \nMessage:\n$LOG" 1>&2
		echo -e "  CMD:$CMD\nMessage:\n$LOG" 1>&2

		return 1
	fi
	echo "  verify_token: Token is valid." 1>&2
	return 0
}

verify_repo(){
	local error=0
	if [ $# -ne 1 ];then
		echo "Aborting: verify_repo accepts exactly one argument" 1>&2
		echo "         usage: verify_repo REPO" 2>&1
		return 1
	fi
	REPO="$1"
	CMD="gh repo view $REPO"
	if [ $VERBOSE -ne 0 ];then
		echo "verify_repo: Executing $CMD" 1>&2
	fi
	if  ! LOG="$(eval $CMD 2>&1)"; then
		echo -e "  verify_repo: Cannot verify repository '$1' " 1>&2
		echo -e "  CMD:$CMD\nMessage:\n$LOG" 1>&2
		return 1
	fi
	echo "  verify_repo: Repository '$1' exists." 1>&2
	return 0
}

verify_branch(){
	local error=0
	if [ $# -ne 2 ];then
		echo "Aborting: verify_branches requires at exactly  two arguments" 1>&2
		echo "         usage: verify_branch REPO BRANCH" 2>&1
		return 1
	fi
	REPO="$1"
	shift

	branch=$1
	CMD="gh api repos/$REPO/branches/BRANCH_NAME --silent $branch"
	if [ $VERBOSE -ne 0 ];then
		echo "verify_branch: Executing $CMD" 1>&2
	fi

	if  ! LOG="$(eval $CMD 2>&1)"; then
		echo -e "  verify_branch: Cannot verify branch '$1' \nMessage:\n$LOG" 1>&2
		echo -e "  CMD:$CMD\nMessage:\n$LOG" 1>&2

		return 1
	fi

	return 0
}

create_from_template(){
	local error=0
	if [ $# -ne 2 ];then
		echo "Aborting: verify_branches requires at least two arguments" 1>&2
		echo "         usage: verify_branches SOURCE NEW_REPO" 2>&1
		return 1
	fi
	TEMPLATE_REPO="$1"
	NEW_REPO="$2"

	if [ $VERBOSE -ne 0 ];then
		echo -e " Creating $NEW_REPO from template $TEMPLATE_REPO..."
	fi
	CMD="gh repo create "$NEW_REPO" --template "$TEMPLATE_REPO" --internal"
	if [ $VERBOSE -ne 0 ];then
		echo -e " create_from_template: Create ${NEW_REPO} from ${TEMPLATE_REPO}:" 1>&2
		echo -e "   CMD: $CMD" 1>&2
	fi
	if ! LOG="$(eval "$CMD" 2>&1)" ;then
		echo -e "Aborting create_from_template: Failed creation of ${NEW_REPO} from ${TEMPLATE_REPO}" 2>&1
		echo -e "\tCMD: $CMD\n\tError messages: $LOG" 1>&2
		return 1
	fi
	return 0
}

create_from_template(){
	local error=0
	if [ $# -ne 2 ];then
		echo "Aborting: verify_branches requires at least two argumentss" 1>&2
		echo "         usage: verify_branches SOURCE NEW_REPO" 2>&1
		return 1
	fi
	TEMPLATE_REPO="$1"
	NEW_REPO="$2"

copy_team_config(){
#copy teams and their permissions between SOURCE and DEST

	if [ $# -ne 2 ];then
		echo "Aborting: copy_team_config not enough arguments" 1>&2
		echo "         usage: copy_team_config SOURCE TARGET" 2>&1
		return 1
	fi
	SOURCE="$1"
	TARGET="$2"
	
	#1. Get team perms from source
	CMD="gh api repos/$SOURCE/teams |jq -c '.[] | {slug: .slug, permission: .permission}'"
	if [ $VERBOSE -ne 0 ];then
		echo -e " copy_team_perm:Getting team permissions with:\n   $CMD" 1>&2
	fi
	if ! PERMS="$(eval "$CMD" 2>&1)" ;then
		echo -e "Aborting copy_team_perm: Failed get of permissions from $SOURCE" 2>&1
		echo -e "\tCMD: $CMD\n\tError messages: $PERMS" 1>&2
		return 1
	fi
	#2. Copy to target
	echo "$PERMS" | while read -r PERM;do
		SLUG=$(echo "$PERM" | jq -r '.slug')
		PERM=$(echo "$PERM" | jq -r '.permission')
		CMD="gh api --method PUT -H 'Accept: application/vnd.github+json' \
orgs/$TARGET_ORG/teams/$SLUG/repos/$TARGET -f permission='$PERM'"
		if [ $VERBOSE -ne 0 ];then
			echo -e "\t copy_team_perm: Adding team $SLUG to $TARGET with:" 1>&2
			echo -e "\t $CMD" 1>&2
		fi
		if ! RET="$(eval $CMD 2>&1)" ;then
			echo -e "Aborting copy_team_perm: failed '$SLUG' copy to '$TARGET'" 2>&1
			echo -e "\tCMD: $CMD\n\tError messages $RET" 1>&2
			return 1
		fi
	done
	return 0
}

copy_users(){
	#copy Teams and users and their permissions between SOURCE and TARGET	
	#To avoids duplicates between users on the SOURCE and the TARGET's
	#users defined in its teams and ORG level access
	
	if [ $# -ne 2 ];then
		echo "Aborting copy_users: incorrect number of arguments" 1>&2
		echo "         usage: copy_users SOURCE TARGET" 1>&2
		return 1
	fi
	SOURCE="$1"
	TARGET="$2"
	
	SOURCE_ORG="${SOURCE%%/*}"
	SOURCE_REPO="${SOURCE##*/}"
	TARGET_ORG="${TARGET%%/*}"
	TARGET_REPO="${TARGET##*/}"


# Variable to hold our master list of people to exclude
	EXCLUDE_USERS=""
#Prep Step 1: Check teams and organization for users	
	#Get Teams information with pagination to ensure we get all of them
	CMD="gh api repos/$SOURCE/teams  --paginate |jq -c '.[] | {slug: .slug, permission: .permission}'"

#	CMD="gh api 'repos/$TARGET/teams' --paginate --jq '.[] | "\(.slug):\(.permission)"'"
	if [ $VERBOSE -ne 0 ];then
		echo -e "copy_user: Get team info on $TARGET with:\n  $CMD" 1>&2
	fi

	if ! TEAMS=$(eval "$CMD 2>&1");then
		echo "Aborting copy_users: Could not get team info from target $TARGET." 1>&2
		echo -e "\tCMD: $CMD\n\tError messages: $TEAMS" 1>&2
		return 1
	fi

	for TEAM_INFO in $TEAMS; do
		TEAM_SLUG=$(echo "$TEAM_INFO" | jq -r '.slug')
		# Fetch members of this team and append them to our exclusion list
		CMD="gh api 'orgs/$TARGET_ORG/teams/$TEAM_SLUG/members' --paginate|jq '.[].login'"
		if [ $VERBOSE -ne 0 ];then
			echo -e "copy_user: Get $TEAM_SLUG team members on $TARGET with:\n  $CMD" 1>&2
		fi
		CMD="gh api 'orgs/$TARGET_ORG/teams/$TEAM_SLUG/members' --paginate|jq '.[].login'"
		if ! MEMBERS=$(eval $CMD 2>&1);then
			echo "Aborting copy_users: could not get team members $TEAM_SLUG on $TARGET." 1>&2
			echo -e "\tCMD: $CMD\n\tError messages: $MEMBERS" 1>&2
			return 1
		fi

		EXCLUDE_USERS="$EXCLUDE_USERS $MEMBERS"
	done
	
	#PrepSstep 2:
	# Get Organization Admins info and fetch org members who have the admin role
	CMD="gh api 'orgs/$TARGET_ORG/members?role=admin' --paginate --jq '.[].login'"
	if [ $VERBOSE -ne 0 ];then
		echo -e "copy_user: Get org members on $TARGET with:\n  $CMD" 1>&2
	fi
	
	if ! ORG_ADMINS=$(eval $CMD 2>&1);then
		echo "Aborting copy_users: Could not get org level members on $TARGET." 1>&2
		echo -e "\tCMD: $CMD\n\tError messages: $ORG_ADMINS" 1>&2
		return 1
	fi
	EXCLUDE_USERS="$EXCLUDE_USERS $ORG_ADMINS"

	# Clean up the exclusion list to contain only unique usernames and remove empty lines
	UNIQUE_EXCLUDE_LIST=$(echo "$EXCLUDE_USERS" | tr ' ' '\n' | awk 'NF' | sort -u)

	# Copying Individual Users"
	# 1. Get individual collaborators
	CMD="gh api repos/$SOURCE/collaborators?affiliation=direct --jq '.[] | {login:.login, role_name:.role_name}'"
	if [ $VERBOSE -ne 0 ];then
		echo -e "Get individual collaborators using:\n  $CMD" 1>&2
	fi
	# Fetch direct collaborators and their permissions
	if ! USERS=$(eval "$CMD" 2>&1) ;then
		echo "Aborting copy_users: Could not READ of individual users from $SOURCE." 1>&2
		echo -e "\tCMD: $CMD\n\tError messages: $LOG" 1>&2
		return 1
	fi
	for collab in $(echo $USERS|jq -c '.');do
		LOGIN=$(echo $collab | jq -r '.login')
		ROLE=$(echo $collab | jq -r '.role_name')
	    if echo "$UNIQUE_EXCLUDE_LIST" | grep -qw "$LOGIN"; then
			if [ $VERBOSE -ne 0 ];then
				echo "Skip '$LOGIN' (Access via Team or Org-level)."
			fi
			continue
		fi

		CMD="gh api --method PUT 'repos/$TARGET/collaborators/$LOGIN' \
-f 'permission=$ROLE' --silent"
		if [ $VERBOSE -ne 0 ];then
			echo -e "\tAdding user: $LOGIN with $ROLE using:" 1>&2
			echo -e "\t  CMD: $CMD"
		fi
		if ! LOG="$(eval $CMD 2>&1)" ;then
			echo "Warning copy_users: Failed add of $LOGIN with $ROLE on $TARGET." 1>&2
			echo -e "\tCMD: $CMD\n\tError messages: $LOG" 1>&2
		fi
	done
	return 0


}

	
copy_users_all(){
	#copy users and their permissions between SOURCE and DEST
	# will copy org level and team members.
	
	if [ $# -ne 2 ];then
		echo "Aborting copy_users: not enough arguments" 1>&2
		echo "         usage: copy_users SOURCE TARGET" 1>&2
		return 1
	fi
	SOURCE="$1"
	TARGET="$2"

	# 1. Get individual collaborators
	CMD="gh api repos/$SOURCE/collaborators?affiliation=direct --jq '.[] | {login:.login, role_name:.role_name}'"
	if [ $VERBOSE -ne 0 ];then
		echo -e "Get individual collaborators using:\n  $CMD" 1>&2
	fi
	# Fetch direct collaborators and their permissions
	if ! USERS=$(eval "$CMD" 2>&1) ;then
		echo "Aborting copy_users: Could not READ of individual users from $SOURCE." 1>&2
		echo -e "\tCMD: $CMD\n\tError messages: $LOG" 1>&2
		return 1
	fi
	for collab in $(echo $USERS|jq -c '.');do
		LOGIN=$(echo $collab | jq -r '.login')
		role=$(echo $collab | jq -r '.role_name')
		CMD="gh api --method PUT 'repos/$TARGET/collaborators/$LOGIN' \
-f 'permission=$ROLE' --silent"
		if [ $VERBOSE -ne 0 ];then
			echo -e "\tAdding user: $LOGIN with $ROLE using:" 1>&2
			echo -e "\t  CMD: $CMD"
		fi
		if ! LOG="$(eval $CMD 2>&1)" ;then
			echo "Warning copy_users: Failed add of $LOGIN with $ROLE on $TARGET." 1>&2
			echo -e "\tCMD: $CMD\n\tError messages: $LOG" 1>&2
		fi
	done
	return 0
}


copy_rule_sets(){
	echo $VERBOSE
	if [ $# -ne 2 ];then
		echo "Aborting copy_rule_sets: not enough arguments" 1>&2
		echo "         usage: copy_rule_sets SOURCE TARGET" 2>&1
		return 1
	fi
	SOURCE="$1"
	TARGET="$2"

	CMD="gh api repos/$SOURCE/rulesets|jq -c '.[] | {id: .id, name: .name}'"
	if [ $VERBOSE -ne 0 ];then
		echo -e " Getting list of rulesets using:\n  $CMD" 1>&2
	fi
	if ! RULESETS="$(eval "$CMD" 2>&1)" ;then
		echo -e "Aborting copy_rule_sets: Failed getting ruleset list from $SOURCE." 1>&2
		echo -e "\tCMD: $CMD\n\tError messages: $RULESETS" 1>&2
		return 1
	fi

	echo "$RULESETS" | while read -r RULESET; do
		if [ $VERBOSE -ne 0 ];then
			echo -e "  copy_rule_sets: Ruleset information: $RULESET" 1>&2
		fi
		RS_ID="$(echo "$RULESET" | jq -r '.id')"
		RS_NAME="$(echo "$RULESET" | jq -r '.name')"
		rm -f .ruleset.*.json
		RS_JSON=.ruleset.$$.json
		
		CMD="gh api repos/$SOURCE/rulesets/$RS_ID | jq 'del(.id, .node_id, ._links, .created_at, .updated_at)' > $RS_JSON"
		if [ $VERBOSE -ne 0 ];then
			echo -e "\tcopy_rule_sets:Gettimg details of Ruleset '$RS_NAME' using" 1>&2
			echo -e "\t   CMD:$CMD" 1>&2
		fi
		
		if ! LOG="$(eval "($CMD)" 2>&1)" ;then
			echo "Aborting copy_rule_sets: Getting ruleset $RS_NAME details failed" 1>&2
			echo -e "\tCMD: $CMD\n\tError messages: $LOG" 1>&2
			return 1
		fi

		if [ ! -f $RS_JSON -o $(cat $RS_JSON|wc -l) -eq 0 ];then
			echo "Aborting copy_rule_sets: No ruleset details were return $RS_NAME." 1>&2
			echo -e "\tCMD: $CMD" 1>&2
			retun 1
		fi	 	
		CMD="gh api repos/$TARGET/rulesets | jq '.[] | select(.name == \"$RS_NAME\") | .id'"
		if [ $VERBOSE -ne 0 ];then
			echo -e "\tCheck for ruleset '$RS_NAME' on $TARGET" 1>&2
		fi
		EXISTING_ID=$(eval "$CMD" 2>&1)

		if [ -n "$EXISTING_ID" ];then
			if [ $VERBOSE -ne 0 ];then
				echo -e -n "\tcopy_rule_sets:Updating ruleset'$RS_NAME' on $TARGET" 1>&2
			fi
			CMD="gh api -X PUT repos/$TARGET/rulesets/$EXISTING_ID --input $RS_JSON"
		else
			if [ $VERBOSE -ne 0 ];then
				echo -e  "\tcopy_rule_sets: Creating ruleset '$RS_NAME' on $TARGET" 1>&2
			fi
			CMD="gh api -X POST repos/$TARGET/rulesets --input $RS_JSON"
		fi		
		if [ $VERBOSE -gt 1 ];then
			echo -e -n "using\n\t   CMD: $CMD\n\t RULE: " 1>&2
			cat "$RS_JSON"|sed 's+^+\t\t+' 1>&2
		fi
		if ! LOG="$(eval "$CMD" 2>&1 )" ;then
			rm -f $RS_JSON
			echo "Aborting copy_rule_sets: Failed WRITE '$RS_NAME' to $TARGET" 1>&2
			echo -e "\tCMD: $CMD\n\tError messages: " 1>&2
			echo -e "$LOG"|sed 's+^+\t\t+' 
			return 1
		fi
	done
	rm -f $RS_JSON
	set +xv
	return 0
}

copy_repo_files(){
	if [ $# -lt 3 ];then
		echo "Aborting copy_repo_files: not enough arguments" 1>&2
		echo "         usage: copy_repo_files SOURCE TARGET FILE/DIR1...FILE/DIRn" 1>&2
		return 1
	fi
	SRC_REPO="$1"
	shift
	TARG_REPO="$1"
	shift
	FILE_SPECS="$*"
	echo $FILE_SPECS
	declare -a FILES_TO_COPY=()
	#NB for reference piping to the shell
	#--	gh api /repo... |jq -r '.tree[] | select(.type == "blob") | .path'| while read -r FILE;do
	# would fail as the last stage is in a sub shell.
	# Use Process Substitution method (< <(...)), the standard.
set -xv
	while read -r FILE; do
		for SPEC in $FILE_SPECS; do
			if [[ $FILE == $SPEC ]]; then
				FILES_TO_COPY+=("$FILE")
			fi
		done
	done < <(gh api /repos/noaa-nwfsc/asdt-template/git/trees/main?recursive=true | jq -r '.tree[] | select(.type == "blob") | .path')
set +xv
	echo ${FILES_TO_COPY[@]}
	return 0
	# Clone the target repo and enter it
	rm -f -r  ./.targ.$TARG_REPO.repo
	CMD="gh repo clone $TARG_REPO ./.targ.$TARG_REPO.repo"
	if [ $VERBOSE -ne 0 ];then
		echo -e  "copy_repo_files: cloning target repo using:" 1>&2
		echo -e "\t   CMD: $CMD " 1>&2
	fi
	if ! LOG="$(eval "$CMD" 2>&1 )" ;then
			echo " copy_repo_files: Failed  target repo ($TARG_REPO) clone using:" 1>&2
			echo -e "\tCMD: $CMD\n\tError messages: " 1>&2
			echo -e "$LOG"|sed 's+^+\t\t+' 
			popd >& /dev/null
			return 1
	fi
	pushd ./.targ.$TARG_REPO.repo >& /dev/null
	

	# Fetch all branches and prune local tracking
	CMD="git fetch --all --prune"
	if [ $VERBOSE -ne 0 ];then
		echo -e  "copy_repo_files: Fetching all branches using:" 1>&2
		echo -e "\t   CMD: $CMD " 1>&2
	fi
	if ! LOG="$(eval "$CMD" 2>&1 )" ;then
			echo " copy_repo_files: Failed  fetch of ($TARG_REPO) using:" 1>&2
			echo -e "\tCMD: $CMD\n\tError messages: " 1>&2
			echo -e "$LOG"|sed 's+^+\t\t+' 
			popd >& /dev/null
			return 1
	fi


	# Loop through every remote branch (excluding HEAD)
	for BRANCH in $(git branch -r | grep -v '\->' | sed 's/origin\///'); do
		if [ $VERBOSE -ne 0 ];then
			echo -e "\tcopy_repo_files: Updating branch: $BRANCH"
		fi
    
    # Switch to the branch
		CMD="git checkout -f $BRANCH"
		if [ $VERBOSE -ne 0 ];then
			echo -e  "copy_repo_files: Check out of branch $BRANCH:" 1>&2
			echo -e "\t   CMD: $CMD " 1>&2
		fi
		if ! LOG="$(eval "$CMD" 2>&1 )" ;then
			echo -e  "copy_repo_files: Failed check out of branch $BRANCH:" 1>&2
			echo -e "\tCMD: $CMD\n\tError messages: " 1>&2
			echo -e "$LOG"|sed 's+^+\t\t+' 
			popd >& /dev/null
			return 1
		fi
    # Use gh to get the file content from the source repo and write it locally
    # This avoids adding remotes or managing complex merge logic
		for FILE in ${FILES_TO_COPY[@]}; do
			mkdir -p $(dirname $FILE)
			CMD="gh api repos/$SRC_REPO/contents/$FILE -q .content | base64 -d > $FILE"
			if [ $VERBOSE -gt 1 ];then
				echo -e  "copy_repo_files: Getting file content for $FILE:" 1>&2
				echo -e "\t   CMD: $CMD " 1>&2
			fi
			if ! LOG="$(eval "$CMD" 2>&1 )" ;then
				echo -e  "copy_repo_files: Failed to get file content for $FILE:" 1>&2
				echo -e "\tCMD: $CMD\n\tError messages: " 1>&2
				echo -e "$LOG"|sed 's+^+\t\t+' 
				popd >& /dev/null
				return 1
			fi
		done

		# Commit the changes
		git add ${FILES_TO_COPY[@]} >& /dev/null
		CMD="(git commit -m 'Sync ${FILES_TO_COPY[@]} from $SRC_REPO' || echo -n)"
		if [ $VERBOSE -ne 0 ];then
			echo -e  "copy_repo_files: $BRANCH: Adding/Committing ${FILES_TO_COPY[@]}" 1>&2
		fi
		if ! LOG="$(eval "$CMD" 2>&1 )" ;then
			echo -e  "copy_repo_files: Failed  $BRANCH: Add/Commit of ${FILES_TO_COPY[@]}" 1>&2
			echo -e "\tCMD: $CMD\n\tError messages: " 1>&2
			echo -e "$LOG"|sed 's+^+\t\t+' 
			popd >& /dev/null
			return 1
		fi
		CMD="git push"
		if [ $VERBOSE -ne 0 ];then
			echo -e  "copy_repo_files: Pushing to $BRANCH" 1>&2
			echo -e "\t   CMD: $CMD " 1>&2
		fi
		if ! LOG="$(eval "$CMD" 2>&1 )" ;then
			echo -e  "copy_repo_files: Failed push all branches to origin" 1>&2
			echo -e "\tCMD: $CMD\n\tError messages: " 1>&2
			echo -e "$LOG"|sed 's+^+\t\t+' 
			popd >& /dev/null
			return 1
		fi
	done
	

	popd >& /dev/null
	#clean up
	rm -f -r ./.targ.$TARG_REPO.repo
	rm -f -r ./.src.$TARG_REPO.repo
}

delete_repo(){
	if [ $# -ne 1 ];then
		echo "Aborting delete_repo: function excepts exactly one argument" 1>&2
		echo "         usage: delete_repo TARG" 1>&2
		return 1
	fi
	TARG="$1"
	CMD="gh repo delete --yes $TARG"
	if ! LOG="$(eval "$CMD" 2>&1 )" ;then
			echo "Aborting  delete_repo: Delete of $TARG failed" 1>&2
			echo -e "\tCMD: $CMD\n\tError messages: $LOG" 1>&2
			return 1
	fi
	return 0
}
	
