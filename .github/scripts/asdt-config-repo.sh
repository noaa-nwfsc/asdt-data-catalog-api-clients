#!/usr/bin/env bash
SCRIPT_NAME=$(basename $0)
SCRIPT_DIR=$(dirname $(realpath $0))
SHARED_FUNCTIONS_SH=$SCRIPT_DIR/shared_functions.sh
TEMPLATE_DEF=noaa-nwfsc/asdt-template
GH_HOST_DEF="github.com"
#trap 'rm -f $RS_JSON' HUP EXIT  SIGINT INT

usage(){
	echo -e "Usage: $SCRIPT_NAME  --target <TARGET_REPO> \\"
	echo -e "\t [--credential TOKEN] [--source <TEMPLATE_REPO>]"
	echo -e "  Update setting for repo <TARGET_REPO> from <TEMPLATE_REPO> repository."
	echo -e "  All rules, groups and users are copied over."
	echo -e "   -h|--help returns this message"
	echo -e "   -q|--quiet Suppresses output" 
	echo -e "   -v|--verbose Increase output. Multiple -v's increases output."
	echo -e "   -t|--target TARGET_REPO: Name of repo with setting to be "
	echo -e "            synced."
	echo -e "            Can be set with environment variable TARGET_REPO"
	echo -e "   -s|--source|--template TEMPLATE_REPO: Override of github "
	echo -e "            repository used as template. The default is $TEMPLATE."
	echo -e "            Can be set with environment variable TEMPLATE_REPO"
	echo -e "   -h|--host HOST: Hostname of GitHub server being modified. "
	echo -e "                   If flag not set, uses GH_HOST environment"
	echo -e "                   variable, if it is set. Otherwise uses default."
	echo -e "                   Default: '$GH_GHOST_DEF"
	echo -e "   -c|credentials TOKEN: The github token to use in authenticating."
	echo -e "              If not set, script uses environment varable GH_TOKEN."
	echo -e "              Token must be for a user with admin privs and "
	echo -e "              Token must be configured to use SSO."
	echo -e "              (see https://docs.github.com/en/enterprise-cloud@latest/authentication/authenticating-with-single-sign-on/authorizing-a-personal-access-token-for-use-with-single-sign-on)"
	echo "NB: $SCRIPT_NAME requires the file '$(basename SHARED_FUNCTIONS_SH)'"
	
}

export VERBOSE=0
export QUIET=0
while [ $# -ne 0 ]; do
   	  case "$1" in
		  -h|--help)
			  usage
			  exit
			  ;;
		  
		  -c|credential*)
			  shift
			  GH_TOKEN=$1
			  shift
			  ;;
		  -h|--host*)
			shift
			GH_HOST="$1"
			shift
			;;

		  -t|--target)
			  shift
			  TARGET_REPO=$1
			  shift
			  ;;
		  
		  -s|--source|--template)
			  shift
			  TEMPLATE_REPO=$1
			  shift
			  ;;
		  
		  -q|--quiet)
			  export QUIET=1
			  shift
			  ;;
		  
		  -v|--verbose)
			  (( VERBOSE ++ ))
			  if [ $VERBOSE -gt 1 ];then set -xv;fi
			  shift		  
			  ;;

		  *)
			  echo "Aborting: Invalid option '$1'" 1>&2
			  usage 1>&2
			  exit 1
;;
	  esac
done
if [ "$GH_HOST" = "" ];then export GH_HOST=$"GH_HOST_DEF";fi

if [ -f "$SCRIPT_DIR/shared_functions.sh" ]; then
   . "$SCRIPT_DIR/shared_functions.sh" 
else
	echo "Aborting: Missing shared functions file: '$SHARED_FUNCTONS_SH'" 1>&2
	usage 1>&2
	return 1
fi


if [ "$TEMPLATE_REPO" = "" ];then
	export TEMPLATE_REPO=$TEMPLATE_DEF
fi
if [ "$TARGET_REPO" = "" ];then
	echo "Aborting: No target repo provided." 2>&1
	usage 2>&1
	exit 1
fi
if [ "$GH_TOKEN" = "" ];then
	echo "Aborting: No token provide by argument or environment variable." 2>&1
	usage 2>&1
	exit 1
else
	if [ $QUIET -eq 0 ];then echo "Verifying GH_TOKEN";fi
	if ! LOG=$(verify_token 2>&1 ) ;then abort "Invalid GH_TOKEN" "$LOG";exit;fi
fi

SOURCE="$TEMPLATE_REPO"
TARGET="$TARGET_REPO"
SOURCE_ORG="${TEMPLATE_REPO%%/*}"
SOURCE_BASE="${TEMPLATE_REPO##*/}"
TARGET_ORG="${TARGET_REPO%%/*}"
TARGET_BASE="${TARGET_REPO##*/}"

if [ $VERBOSE -ne 0 ];then export QUIET=0;fi
if [ $VERBOSE -ne 0 ];then LOG_OUT="1>&2";else LOG_OUT="2>&1";fi

# 1.a Check if template exist 
if [ $QUIET -eq 0 ];then echo "Checking if template repo ($SOURCE) is present.";fi
CMD="verify_repo $SOURCE ${LOG_OUT}"
if ! LOG="$(eval $CMD)"  ;then abort "Template source repo ($SOURCE) does not exist.";fi

# 1.b Check if target exists.
if [ $QUIET -eq 0 ];then echo "Checking if configuration target ($TARGET) is present.";fi
CMD="verify_repo $TARGET ${LOG_OUT}"
if ! LOG="$(eval $CMD)"  ;then abort "Configuration target ($TARGET) does not exist.";fi
#--	 
#--# 2. Sync Permissions for each team
#--MSG="Syncing Team Configurations"
#--if [ $QUIET -eq 0 ];then echo "$MSG...";fi
#--CMD="copy_team_config $SOURCE $TARGET $LOG_OUT"
#--if ! LOG="$(eval $CMD )";then abort "Failed: $MSG" "$LOG";fi 1>&2
#--
#--# 3. Sync Repository Branch Rulesets
#--MSG="Syncing Repository Branch Rulesets"
#--if [ $QUIET -eq 0 ];then  echo -e "$MSG...";fi
#--CMD="copy_rule_sets $SOURCE $TARGET $LOG_OUT"
#--if ! LOG="$(eval $CMD )";then abort "Failed: $MSG" "$LOG";fi 1>&2
#--
#--# 4. Copy users
#--MSG="Copying Users"
#--if [ $QUIET -eq 0 ];then  echo -e "$MSG...";fi
#--CMD="copy_users $SOURCE $TARGET $LOG_OUT"
#--if ! LOG="$(eval $CMD )";then abort "Failed: $MSG" "$LOG";fi 1>&2
#--
# 5. Copy config files
MSG="Copying config files"
if [ $QUIET -eq 0 ];then  echo -e "$MSG...";fi
FILES_TO_COPY="git_tools/* .github/* .gitleaks.toml LICENSE NOAA-NWFSC_Repo_Conventions/*"
export VERBOSE=1
if [ $VERBOSE -ne 0 ];then LOG_OUT="1>&2";else LOG_OUT="2>&1";fi
CMD="copy_repo_files $SOURCE $TARGET $FILES_TO_COPY  $LOG_OUT "
if ! LOG="$(eval $CMD )";then abort "Failed: $MSG" "$LOG";fi 1>&2



if [ $QUIET -eq 0 ];then echo "Sync completed.";fi
