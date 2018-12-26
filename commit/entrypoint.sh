#!/bin/sh

set -e

#echo "Installing git"
#apk update
#apk add git

pwd
if [ -n "$WD_PATH" ]
then
  echo "Changing dir to $WD_PATH"
  cd $WD_PATH
fi

git status

# This section only runs if there have been file changes
if ! git diff --quiet
then 
  git add .
  git commit -m "Regenerate build artifacts."
  git push
fi