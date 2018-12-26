#!/bin/sh

set -e

if [ -n "$WD_PATH" ]
then
  echo "Changing dir to $WD_PATH"
  cd $WD_PATH
fi

# This section only runs if there have been file changes
if ! git diff --quiet
then 
  git add .
  git commit -m "Regenerate build artifacts."
  git push
else 
  echo "Working tree clean. Nothing to commit."
fi