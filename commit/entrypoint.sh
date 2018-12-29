#!/bin/sh

set -e

if [ -n "$WD_PATH" ]
then
  echo "Changing dir to $WD_PATH"
  cd $WD_PATH
fi

# Set up .netrc file
git_setup ( ) {
  cat <<- EOF > $HOME/.netrc
		machine github.com
		login $GITHUB_ACTOR
		password $GITHUB_TOKEN

		machine api.github.com
		login $GITHUB_ACTOR
		password $GITHUB_TOKEN
EOF
  chmod 600 $HOME/.netrc

  # Can we proceed without global setup here?
  # Maybe, so long as we specifiy the --author option on commit
  git config user.email "$GITHUB_ACTOR@users.noreply.github.com"
  git config user.name "$GITHUB_ACTOR"
}


# This section only runs if there have been file changes
echo "Checking for uncommitted changes in the git working tree."
if ! git diff --quiet
then 
  git_setup
  git add .
  git commit -m "Regenerate build artifacts."
  GITHUB_BRANCH=`echo $GITHUB_REF | awk -F / '{ print $3 }'`
  git push --set-upstream origin $GITHUB_BRANCH
else 
  echo "Working tree clean. Nothing to commit."
fi