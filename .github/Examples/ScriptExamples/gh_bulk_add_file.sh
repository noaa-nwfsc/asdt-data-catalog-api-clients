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

usage(){

	echo
	echo "Usage: $SCRIPT_NAME  Source_File Repo_Target_Path [options]"
	echo " For all branchs of all repostories in a GitHub organization [Default '$ORG_NAME']," 
	echo " if the repository name matches a given regular expression [Default '$REPO_REGX'],"
	echo " copy local file <Source_File> to git repository path <Repo_Target_Path>."
	echo " NB: $SCRIPT_NAME uses $(basename $REPO_UPDATER)."
	echo "     Both must be in the same directory ('$SCRIPT_DIR')"
	echo "  Options:"
	echo -e "   -g|--github <GitServer>:   Hostname of GitHub being modified."
	echo -e "                              Default: '$GHOST'"
	echo -e "   -p|--protocol <ssh|https>: Protocol used for git operations."
	echo -e "                              Default '$PROTOCOL'"
	echo -e "   -r|==regx <RegExpression>: Regular express used to select repositories."
	echo -e "                              Default: '$REPO_REGX'"
	echo -e "   -o|--org <Git_Hub_Org>:    The Github organzation"
	echo -e "                              Default: '$ORG_NAME'"
	echo -e "   -h|--help returns this message"
	echo -e "   -q|--quiet Suppresses output" 
	echo -e "   -v|--verbose Increase output. Multiple -v's increases output." 


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
			(( VERBOSE_LEVEL ++ ))
			shift		  
			;;
		-g|--github*)
			shift
			GHOST="$1"
			;;
		-p|--git-protocol)
			shift
			PROTOCOL="$1"
			;;
		-o|--org)
			shift
			ORG_NAME="1"
			;;
		-r|--reg*)
			shift
			REGX="$1"
			;;
		*)    # unknown options are command arguments
			CMD_ARGS+=("$1")
			shift
			;;
	esac
done

if [ ${#CMD_ARGS[@]} -eq 0 ];then
	usage
	exit 0
elif [ ${#CMD_ARGS[@]} -lt 2 ];then
	echo "ABORTING: Not enough arguments: <Source_File> and <Repo_Target_Path> required."
	usage
	exit 1
elif [ ${#CMD_ARGS[@]} -gt 2 ];then
	echo "ABORTING: Too many arguments: only <Source_File> and <Repo_Target_Path> allowed."
	usage
	exit 1
fi

SOURCE_FILE="${CMD_ARGS[0]}"
if [ ! -f $SOURCE_FILE ];then
	echo "ABORTING: Source_File $SOURCE_FILE not found."
	usage
	exit 1
fi

REPO_TARGET_PATH="${CMD_ARGS[1]}"
if [ $VERBOSE -gt 0 -a $QUIET -ne 1 ];then
	set -xv
fi
STATUS=$(gh auth status -h $GHOST 2>&1)
RET=$?
SCOPE="$(echo "$STATUS"|sed '/gist/!d;/project/!d;/read:org/!d;/repo/!d;/workflow/!d')"
if [ $RET -ne 0 -o "$SCOPE" = "" ];then #nned to reauth in either case
	if [ $RET -eq 0 ];then gh auth logout -h $GHOST;fi  #logging in but with bad perms
	CMD="gh auth login -h $GHOST -p $PROTOCOL --scopes repo,read:org,gist,workflow,project"
	eval $CMD
else
	if [ $QUIET -ne 1 ];then echo -n -e "Using existing connection: ";fi
fi
if [ $QUIET -ne 1 ];then gh auth status -h $GHOST;fi

#REPOS=("asdt-auth" "asdt-data-collection")
CMD="gh repo list $ORG_NAME --json name -q '.[].name'|grep '^asdt'|sort"
REPOS=($(eval $CMD))
DASHQ=""
if [ $QUIET -eq 1 ];then
	DASHQ="-q"
fi
for REPO in "${REPOS[@]}"; do
	CMD="$REPO_UPDATER $DASHQ -n '$SOURCE_FILE' '$ORG_NAME/$REPO' '$REPO_TARGET_PATH'"
	eval $CMD 2>&1
	RET=$?
	if [ $RET != 0 ];then
		echo "Failed "
		echo "Command: $CMD"
		echo "Aborting"
		exit 1
	fi
done

echo "Updates from $SOURCE_FILE to $REPO_TARGET_PATH  for repos matching '$REPO_REGX' in $GHOST:$ORG completed."
