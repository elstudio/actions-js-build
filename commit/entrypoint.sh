#!/bin/sh

set -e

if [ -n "$WD_PATH" ]
then
  echo "Changing dir to $WD_PATH"
  cd $WD_PATH
fi

# Set up .netrc file
setup_netrc ( ) {
  cat << EOF > $HOME/.netrc
machine github.com
login $GITHUB_ACTOR
password $GITHUB_TOKEN

machine api.github.com
login $GITHUB_ACTOR
password $GITHUB_TOKEN

EOF
  chmod 600 $HOME/.netrc
  echo "HOME directory contents"
  ls -al $HOME
}

# Show the event json
cat $GITHUB_EVENT_PATH


# This section only runs if there have been file changes
if ! git diff --quiet
then 
  setup_netrc
  git config --global user.email "servers@el-studio.com"
  git config --global user.name "$GITHUB_ACTOR"
  git add .
  git commit -m "Regenerate build artifacts."
  GITHUB_BRANCH=grunt-actions
  #GITHUB_BRANCH=`echo $GITHUB_REF | awk -F / '{ print $3 }'`
  git push --set-upstream origin $GITHUB_BRANCH
else 
  echo "Working tree clean. Nothing to commit."
fi