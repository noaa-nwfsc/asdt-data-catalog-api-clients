#!/bin/bash
SCRIPT_NAME=$(basename $0)
SCRIPT_DIR=$(dirname $(realpath $0))
REPO_UPDATER=$SCRIPT_DIR/gh_repo_add_file.sh
if [ ! -f $REPO_UPDATER ];then
	echo "ABORTING:  Cannot locate updater script $REPO_UPDATER" 1>&2
fi
REPO_REGX='^asdt-.*'
GHOST=github.com
PROTOCOL=ssh
ORG_NAME="noaa-nwfsc"
DELETE_BRANCH_ON_MERGE=true 
ENABLE_AUTO_MERGE=false 
ENABLE_MERGE_COMMIT=false
ENABLE_REBASE_MERGE=false
ENABLE_SQUASH_MERGE=true 

usage(){
	echo -e "$SCRIPT_NAME for repos matching a given regex in a specified organization "
	echo -e "configure there PR defaults."
	echo -e
	echo -e "Usage: $SCRIPT_NAME"
	echo -e "   --delete-branch-on-merge true|false (Default $DELETE_BRANCH_ON_MERGE)" 
	echo -e "   --enable-auto-merge true|false      (Default $ENABLE_AUTO_MERGE)"
	echo -e "   --enable-merge-commit true|false    (Default $ENABLE_MERGE_COMMIT)"
	echo -e "   --enable-rebase-merge true|false    (Default $ENABLE_REBASE_MERGE)"
	echo -e "   --enable-squash-merge true|false    (Default $ENABLE_SQUASH_MERGE)"
	echo -e "   -t|--token <Token>         Github token used to authenticate."
	echo -e "                              Can be set by $GH_TOKEN environment variable."
	echo -e "   -g|--github <GitServer>:   Hostname of GitHub being modified."
	echo -e "                              Default: '$GHOST'"
	echo -e "   -r|==regx <RegExpression>: Regular express used to select repositories."
	echo -e "                              Default: '$REPO_REGX'"
	echo -e "   -o|--org <Git_Hub_Org>:    The Github organzation"
	echo -e "                              Default: '$ORG_NAME'"
	echo -e "   -h|--help returns this message"
	echo -e "   -q|--quiet Suppresses output" 
	echo -e "   -v|--verbose Increase output. Multiple -v's increases output." 
	echo -e
	echo -e "If the script is run with no arguments the GitHub Server used is '$GHOST',"
	echo -e "the GitHub Organization used is '$ORG_NAME', and repositories with "
	echo -e  "names matching '$REPO_REGX' will be configured with the default settings:"
	echo -e "    Delete Branch On Merge  = $DELETE_BRANCH_ON_MERGE"
	echo -e "    Enable Auto Merge  = $ENABLE_AUTO_MERGE"
	echo -e "    Enable Merge Commit= $ENABLE_MERGE_COMMIT"
	echo -e "    Enable Rebase Merge= $ENABLE_REBASE_MERGE"
	echo -e "    Enable Squash Merge= $ENABLE_SQUASH_MERGE"


}
VERBOSE=0
QUIET=0
declare -a CMD_ARGS=()

while [[ $# -gt 0 ]]; do
	key=$"$1"
	case $"$key" in
		-h|--h|--help)
			usage 
			exit 0
			;;
		-q|--quiet)
			export QUIET=1
			shift
			;;
		-v|--verbose)
			(( VERBOSE ++ ))
			shift		  
			;;
		-g*|--github*)
			if [[ "$1" == *"="* ]]; then
				GHOST="${1#*=}"
			else
				shift
				GHOST="$1"
			fi
			shift
			;;
		-o*|--org*)
			if [[ "$1" == *"="* ]]; then
				ORG_NAME="${1#*=}"
			else
				shift
				ORG_NAME="$1"
			fi
			shift
			;;
		-r*|--reg*)
			if [[ "$1" == *"="* ]]; then
				REPO_REGX="${1#*=}"
			else
				shift
				REPO_REGX="$1"
			fi
			shift
			;;
		-t*|--token*|--github_token*)
			if [[ "$1" == *"="* ]]; then
				export GH_TOKEN="${1#*=}"
			else
				shift
				export GH_TOKEN="$1"
			fi
			shift
			;;

		
		--delete-branch-on-merge)
			if [[ "$1" == *"="* ]]; then
				delete-branch-on-merge="${1#*=}"
			else
				shift
				delete-branch-on-merge="$1"
			fi
			shift
			;;
		--enable-auto-merge)
			if [[ "$1" == *"="* ]]; then
				enable-auto-merge="${1#*=}"
			else
				shift
				enable-auto-merge="$1"
			fi
			shift
			;;
		--enable-merge-commit)
			if [[ "$1" == *"="* ]]; then
				enable-merge-commit="${1#*=}"
			else
				shift
				enable-merge-commit="$1"
			fi
			shift
			;;
		--enable-rebase-merge)
			if [[ "$1" == *"="* ]]; then
				enable-rebase-merge="${1#*=}"
			else
				shift
				enable-rebase-merge="$1"
			fi
			shift
			;;
		--enable-squash-merge)
			if [[ "$1" == *"="* ]]; then
				enable-squash-merge="${1#*=}"
			else
				shift
				enable-squash-merge="$1"
			fi
			shift
			;;
		*)
	echo "ABORTING: Uknown argument."
			usage 1>&2
			exit 1
			;;
	esac
done

if [ $VERBOSE -ne 0 ];then QUIET=0;fi

if [ "$GH_TOKEN" = "" ];then
	echo "ABORTING: GitHub token not by command line or environment variable GH_TOKEN."
	echo
	usage 2>&1
elif [ "$GH_TOKEN" = "" ];then
	export GH_TOKEN="$GITHUB_TOKEN"  #GH_TOKEN is preferred.
fi

#Check host connection
gh auth status --active --hostname $GHOST >& /dev/null
RET=$?
if [ $RET -ne 0 ];then
	echo "ABORTING: Authentication check for GitHub server '$GHOST' failed." 1>&2
usage 1>&2
	exit 1
fi

# Replace with your Organization name
if [ $QUIET -eq 0 ];then
	echo "Fetching repositories for $ORG_NAME..."
fi
# Get all non-archived repository names
REPOS=$(gh repo list $ORG_NAME --limit 1000 --json name --jq '.[].name'|grep $REPO_REGX|sort)
if [ "$REPOS" = "" ];then
	echo "ABORTING: No repos matching $REP_REGX found on $GHOST:$ORG_NAME" 1>&2
fi
for REPO in $REPOS; do
	if [ $QUIET -ne 0 ];then
		echo "Updating $REPO settings..."
	fi
	# Enable Squash, Disable Merge commits, Disable Rebase
	CMD="gh repo edit "$ORG_NAME/$REPO" --delete-branch-on-merge=$DELETE_BRANCH_ON_MERGE --enable-auto-merge=$ENABLE_AUTO_MERGE --enable-merge-commit=$ENABLE_MERGE_COMMIT --enable-rebase-merge=$ENABLE_REBASE_MERGE --enable-squash-merge=$ENABLE_SQUASH_MERGE 2>&1"
	if [ $VERBOSE -ne 0 ];then
		echo -e "Executing $CMD"
		CMD="$CMD |tee >(cat >&2)"
	fi
	LOG="$(eval $CMD) "
	ret=$?
	if [ $ret -ne 0 ];then
		echo "ABORTING:Failed to update $GHOST:$ORG_NAME/$REPO" 1>&2
		# If verbose, no need to push log
		if [ $VERBOSE -eq 0 ];then
			echo -e "Error Log:" 1>&2
			echo "$LOG"|sed 's+^+   +g'; 1>&2
		fi
		exit 1
	fi
#	break
done
if [ $QUIET -eq 0 ];then
	echo "Done! All repositories updated."
fi
if [ $VERBOSE -ne 0 ];then
	echo -e "    Delete Branch On Merge  = $DELETE_BRANCH_ON_MERGE"
	echo -e "    Enable Auto Merge  = $ENABLE_AUTO_MERGE"
	echo -e "    Enable Merge Commit= $ENABLE_MERGE_COMMIT"
	echo -e "    Enable Rebase Merge= $ENABLE_REBASE_MERGE"
	echo -e "    Enable Squash Merge= $ENABLE_SQUASH_MERGE"
fi

