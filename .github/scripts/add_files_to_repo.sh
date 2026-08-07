#!/bin/bash

SCRIPT_NAME=$(basename $0)
SCRIPT_DIR=$(dirname $(realpath $0))
SHARED_FUNCTIONS_SH=$SCRIPT_DIR/shared_functions.sh
REPO_REGX='^asdt-'
GH_HOST_DEF=github.com
PROTOCOL=ssh

usage(){

	echo
	echo "Usage: $SCRIPT_NAME  Source_File Repo Repo_Target_Path [options]"
	echo " For all branches of a specified GitHub repository <Repo>, "
	echo " copy local file <Source_File> to git repository path <Repo_Target_Path>."
	echo "  Options:"
	echo -e "   -h|--host HOST: Hostname of GitHub server being modified. "
	echo -e "                   If flag not set, uses GH_HOST environment"
	echo -e "                   variable, if it is set. Otherwise uses default."
	echo -e "                   Default: '$GH_GHOST_DEF"
	#--echo -e "   -p|--protocol <ssh|https>: Protocol used for git operations."
	#--echo -e "                              Default '$PROTOCOL'"
	#--echo -e "   -n|no_auth:   Do not use gh to login to GitServer if present."
	#--echo -e "                              Default: False"
	echo -e "   -b|branch:    Branch to update on target repo."
	echo -e "                 by default all branches are updated."
	echo -e "   -h|--help:    Returns this message"
	echo -e "   -q|--quiet:   Suppresses output." 
	echo -e "   -v|--verbose: Increase output. Multiple -v's increases output." 
	echo "NB: $SCRIPT_NAME requires the file '$SHARED_FUNCTONS_SH'"
}

VERBOSe=0
QUIET=0
NO_AUTH=0
declare -a CMD_ARGS=()
while [[ $# -gt 0 ]]; do
	key=$"$1"
	case $"$key" in
		-h|--help)
			usage 1>&2
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
		-h|--host*)
			shift
			GH_HOST="$1"
			shift
			;;
		-b|--branch*)
			shift
			BRANCHES="$1"
			shift
			;;
#--		-n|--no_auth)
#--			shift
#--			NO_AUTH=1
#--			;;
#--		-p|--protocol)
#--			shift
#--			PROTOCOL="$1"
#--			shift
#--			;;
		*)    # unknown options are command arguments
			CMD_ARGS+=("$1")
			shift
			;;
	esac
done
if [ -f "$SCRIPT_DIR/shared_functions.sh" ]; then
   . "$SCRIPT_DIR/shared_functions.sh" 
else
	echo "Aborting: Missing shared functions file: '$SHARED_FUNCTONS_SH'" 1>&2
	usage 1>&2
	return 1
fi

if [ "$GH_HOST" = "" ];then export GH_HOST="$GH_HOST_DEF";fi
if [ "$BRANCHES" = "" ];then export BRANCH="ALL_BRANCHES";fi


if [ ${#CMD_ARGS[@]} -eq 0 ];then
	usage
	    return 1 >& /dev/null
    if [ $? != 0 ]; then
        exit 1
    fi
 0
elif [ ${#CMD_ARGS[@]} -lt 2 ];then
	echo "ABORTING: Not enough arguments: <Source_File>, <Repo>, and <Repo_Target_Path> are required."
	usage
	    return 1 >& /dev/null
    if [ $? != 0 ]; then
        exit 1
    fi
 1
elif [ ${#CMD_ARGS[@]} -gt 3 ];then
	echo "ABORTING: Too many arguments: only  <Source_File>, <Repo>, and <Repo_Target_Path> are allowed."
	usage
	    return 1 >& /dev/null
    if [ $? != 0 ]; then
        exit 1
    fi
 1
fi

SOURCE_FILE="${CMD_ARGS[0]}"
if [ ! -f $SOURCE_FILE ];then
	echo "ABORTING: Source_File $SOURCE_FILE not found."
	usage
	    return 1 >& /dev/null
    if [ $? != 0 ]; then
        exit 1
    fi
 1
fi

REPO="${CMD_ARGS[1]}"
REPO_TARGET_PATH="${CMD_ARGS[2]}"
#--
#--STATUS=$(gh auth status -h $GHOST 2>&1)
#--RET=$?
#--if [ $NO_AUTH -eq 0 -o $RET -ne 0 ];then
#--	SCOPE="$(echo "$STATUS"|sed '/gist/!d;/project/!d;/read:org/!d;/repo/!d;/workflow/!d')"
#--	if [ $RET -ne 0 -o "$SCOPE" = "" ];then #nned to reauth in either case
#--		if [ $RET -eq 0 ];then gh auth logout -h $GHOST;fi  
#--		echo -e -n "   Creating new connection:"
#--		CMD="gh auth login -h $GHOST -p $PROTOCOL --scopes repo,read:org,gist,workflow,project"
#--		eval $CMD 2>&1 |sed '2,$s+^+\t+'
#--	else
#--		echo -e -n "   Using existing connection:"
#--	fi
#--	gh auth status -h $GHOST|sed '2,$s+^+\t+'
#--fi
#--
COMMIT_MESSAGE="chore: update ${REPO_TARGET_PATH} across all branches of ${REPO}"
echo  -e "   Updating Repository: $REPO  "
if ! RET=:$(send_files_to_repo $SOURCE $REPO $REPO_TARGET_PATH "$BRANCHES" 2>&1);then
	echo "aborting $SCRIPT_NAME: Failed send of $SOURCEfile to all branches of $REPO $REPO_TARGET_PATH " 1>&2
	exit 1
fi

#--BRANCHES=($(gh api repos/$REPO/branches --jq '.[].name' |sort))
#--for BRANCH in "${BRANCHES[@]}"; do
#--    # Encode the local file to base64 for the API
#--    CONTENT=$(base64 -w 0 < "$SOURCE_FILE")
#--    # Get the current file SHA (required for updating existing files)
#--	CMD="gh api 'repos/$REPO/contents/$REPO_TARGET_PATH?ref=$BRANCH' --jq '.sha'"
#--    SHA="$(eval $CMD 2> /dev/null)"
#--	RET=$?
#--	if [ $RET != 0 ];then
#--		SHA=""
#--	fi
#--
#--    if [ -z "$SHA" ]; then
#--      # File doesn't exist on this branch, create it
#--			if [ $QUIET -ne 1 ];then
#--	echo -n -e "     Branch: $BRANCH...Creating $SOURCE_FILE in $REPO_TARGET_PATH..."
#--fi
#--		CMD="gh api --method PUT 'repos/$REPO/contents/$REPO_TARGET_PATH' \
#--        -f message='$COMMIT_MESSAGE' \
#--        -f content='$CONTENT' \
#--        -f branch='$BRANCH'"
#--    else
#--      # File exists, update it using the SHA
#--			if [ $QUIET -ne 1 ];then
#--	echo -n -e "     Branch: $BRANCH...Updating $REPO_TARGET_PATH with $SOURCE_FILE..."
#--fi
#--		CMD="gh api --method PUT 'repos/$REPO/contents/$REPO_TARGET_PATH' \
#--        -f message='$COMMIT_MESSAGE' \
#--        -f content='$CONTENT' \
#--        -f branch='$BRANCH' \
#--        -f sha='$SHA'"
#--    fi
#--	RESULT="$(eval $CMD 2>&1)"
#--	RET=$?
#--	if [ $RET = 0 ];then
#--			if [ $QUIET -ne 1 ];then
#--	echo "Success"
#--fi
#--	else
#--		echo "Failed "
#--		echo "Error Message: $RESULT"
#--		echo "Command: $CMD"
#--		echo "Aborting"
#--		    return 1 >& /dev/null
#--    if [ $? != 0 ]; then
#--        exit 1
#--    fi
#-- 1
#--	fi
#--done

echo -e "   Completed update of $REPO_TARGET_PATH for all branches of $REPO."
