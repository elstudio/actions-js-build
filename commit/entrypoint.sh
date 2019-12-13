#!/bin/sh
## This GitHub Action for git commits any changed files and pushes 
## those changes back to the origin repository.
##
## Required environment variable:
## - $GITHUB_TOKEN: The token to use for authentication with GitHub 
## to commit and push changes back to the origin repository.
##
## Optional environment variables:
## - $WD_PATH: Working directory to CD into before checking for changes
## - $PUSH_BRANCH: Remote branch to push changes to

if [ "$DEBUG" == "false" ]
then
  # Carry on, but do quit on errors
  set -e
else
  # Verbose debugging
  set -exuo pipefail
  export LOG_LEVEL=debug
  export ACTIONS_STEP_DEBUG=true
fi

# If WD_PATH is defined, then cd to it
if [ ! -z "$WD_PATH" ]
then
  echo "Changing dir to $WD_PATH"
  cd "$WD_PATH"
fi

# Set up .netrc file with GitHub credentials
git_setup ( ) {
  # Git requires our "name" and email address -- use GitHub handle
  git config user.email "$GITHUB_ACTOR@users.noreply.github.com"
  git config user.name "$GITHUB_ACTOR"
}

# This section only runs if there have been file changes
echo "Checking for uncommitted changes in the git working tree."
if expr $(git status --porcelain | wc -l) \> 0
then 
  git_setup
  git add .
  git commit -m "$COMMIT_MESSAGE"
  git push
else 
  echo "Working tree clean. Nothing to commit."
fi
