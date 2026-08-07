#!/bin/bash
# --- Configuration ---
TARGET_BRANCHES=("develop" "master" "test" "jenkins_dev")
REMOTE="origin"
# --- Globals ---
AUTO_YES=0
AUTO_NO=0
VERBOSE=0
CURR_BRANCH=$(git rev-parse --abbrev-ref HEAD)

# --- Helper Functions ---
show_help() {
    echo "Usage: $0 [OPTIONS]"
    echo "Syncs the current branch with a list of target branches."
    echo ""
    echo "Options:"
    echo "  -b, --branches   Comma-separated list of target branches to sync "
	echo "                   default: '$(echo ${TARGET_BRANCHES[@]}|sed "s+ +', '+g")'."
    echo "  -r, --remote     Name of the remote repository (default: $REMOTE)."
    echo "  -y, --yes        Automatically choose 'yes' to update prompts."
    echo "  -n, --no         Automatically choose 'no' (skip) for local file prompts."
    echo "  -v, --verbose    Enable verbose logging."
    echo "  -h, --help       Show this help message and exit."
    exit 0
}

log_verbose() {
    if [[ $VERBOSE -eq 1 ]]; then
        echo -e "  [VERBOSE] $1"
    fi
}

cleanup() {
    echo ""
    echo "[!] Interrupt caught. Returning to initial branch: $CURR_BRANCH"
    # Abort any merge in progress just in case
    git merge --abort >/dev/null 2>&1 
    git checkout "$CURR_BRANCH" >/dev/null 2>&1
    exit 1
}

# Catch Ctrl+C and termination signals
trap cleanup SIGINT SIGTERM

# --- Argument Parsing ---
while [[ "$#" -gt 0 ]]; do
    case $1 in
		-b|--branches)
            # Parse comma-separated string into the TARGET_BRANCHES array
            IFS=',' read -r -a TARGET_BRANCHES <<< "$2"
            shift 2
            ;;
        -y|--yes) AUTO_YES=1 ;;
        -n|--no) AUTO_NO=1 ;;
        -v|--verbose) VERBOSE=1 ;;
        -h|--help) show_help ;;
        *) echo "Unknown parameter passed: $1"; exit 1 ;;
    esac
    shift
done

if [[ $AUTO_YES -eq 1 && $AUTO_NO -eq 1 ]]; then
    echo "Error: Cannot use both --yes and --no flags at the same time."
    exit 1
fi

echo "Syncing branch '$CURR_BRANCH' to branches '$(echo "${TARGET_BRANCHES[@]}"|sed "s+ +', '+g")'."

# --- 1. Check for Modified/Added (Not Committed) Files ---
# grep -v '^??' filters out untracked files, leaving only tracked modifications/additions
MODIFIED_FILES=$(git status --porcelain | grep -v '^??')

if [[ -n "$MODIFIED_FILES"  ]]; then
    echo -n "  Detected modified or deleted tracked files:"
    log_verbose "\n$MODIFIED_FILES"|sed -e 's+^\([A-Z]\) +\t\1+' -e 's+^ \([A-Z]\) +\t\1 +'
    
    choice=""
    if [[ $AUTO_YES -eq 1 ]]; then
        choice="c"
        echo -e " The -y/--yes flag set:committing."
    elif [[ $AUTO_NO -eq 1 ]]; then
        choice="s"
        echo -e " The -n/--no flag set:skipping"
    else
        read -p " Commit/push (c) changes or skip (s)? [c/s]: " choice
    fi

    if [[ "$choice" =~ ^[cC]$ || "$choice" =~ ^[yY]$ ]]; then
        #read -p "Enter commit message: " msg
		msg="Checking in $CURR_BRANCH prior to synch"
        log_verbose "Committing tracked changes."
        if ! LOG="$(git commit -a -m "$msg" 2>&1 )";then
			echo -e "Commit failed:\nLOG:\n$LOG"
		fi
        log_verbose "Pushing $CURR_BRANCH to $REMOTE."
		if ! LOG="$(git push "$REMOTE" "$CURR_BRANCH" 2>&1)";then
			echo -e "Push failed:\nLOG:\n$LOG"
		fi
    else
        echo "  Skipping modified files."
    fi
fi

# --- 2. Check for Untracked Files ---
# grep '^??' isolates strictly untracked files
UNTRACKED_FILES=$(git status --porcelain | grep '^??')

if [[ -n "$UNTRACKED_FILES" ]]; then
    echo -n "  Detected untracked files: "
    log_verbose "\n$UNTRACKED_FILES" |sed 's+^+\t -+'g
    
    choice=""
    if [[ $AUTO_YES -eq 1 ]]; then
        choice="a"
        echo "Auto-yes flag detected: Choosing to add and commit."
    elif [[ $AUTO_NO -eq 1 ]]; then
        choice="s"
        echo "Auto-no flag detected: Skipping untracked files."
    else
        read -p "Add (a) commit and push files or Skip (s)? [a/s]: " choice
    fi

    if [[ "$choice" =~ ^[aA]$ ||  "$choice" =~ ^[yY]$ ]]; then
        #read -p "Enter commit message for untracked files: " msg
        log_verbose "Adding untracked files safely."
        
        # Safely add only untracked files (protects modified files if user skipped them)
        git status --porcelain | grep '^??' | cut -c 4- | while read -r file; do
            git add "$file"
        done
        
        git commit -m "Adding untracked file $file"
        log_verbose "Pushing $CURR_BRANCH to $REMOTE."
        git push $REMOTE "$CURR_BRANCH"
    else
        log_verbose "  Skipping untracked files."
    fi
fi

log_verbose "Beginning branch iteration loop."

# --- 3. Sync Branches ---
for branch in "${TARGET_BRANCHES[@]}"; do
    if [[ "$branch" == "$CURR_BRANCH" ]]; then
        log_verbose "  Skipping $branch (matches current starting branch)."
        continue
    fi

    echo "Synching '$CURR_BRANCH' branch to '$branch'"

    # Verify branch exists on the origin system
    log_verbose "Checking if $branch exists on $REMOTE: $(git remote get-url $REMOTE)."
    if ! git ls-remote --heads $REMOTE "$branch" | grep -q "$branch"; then
        echo "  Skipping branch '$branch' does not exist on $REMOTE $(git remote get-url $REMOTE). "
        continue
    fi

    # Checkout the target branch
    log_verbose "Checking out $branch locally."
    if ! git checkout -f "$branch" >/dev/null 2>&1; then
        echo -e "Failed to checkout '$branch'. Skipping to next."
        continue
    fi
	git commit -am 'Checkpoint $(date)' >& /dev/null
    
    # Pull latest from remote to ensure we are up to date before merging
    log_verbose "Pulling latest changes for $branch from $REMOTE."
    git pull -X theirs $REMOTE "$branch" >/dev/null 2>&1

    # Merge current branch into the target branch (overwriting conflicts)
    log_verbose "Merging $CURR_BRANCH into $branch (strategy: theirs)..."
    if ! LOG="$(git merge -X theirs "$CURR_BRANCH" -m "Sync: Merged $CURR_BRANCH into $branch" 2>&1)"; then
		echo -e "Failed merge of $CURR_BRANCH to $branch" 1>&2
		git merge --abort
		continue
	fi
    log_verbose "Merge successful."
        
    # Push to remote
    log_verbose "Pushing $branch to $REMOTE: git push $REMOTE $branch"
    if ! LOG="$(git push $REMOTE "$branch" 2>&1)" ;then
		echo -e "Failed push of $branch to $(git remote get-url $REMOTE)" 1>&2
		continue
    fi
done

# --- 4. Finalize ---
echo "Returning to initial branch: $CURR_BRANCH"
git checkout "$CURR_BRANCH" >/dev/null 2>&1
