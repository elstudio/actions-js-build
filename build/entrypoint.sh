#!/bin/sh

set -e

if [ -n "$WD_PATH" ]
then
  echo "Changing dir to $WD_PATH"
  cd $WD_PATH
fi

echo "Installing NPM dependencies"
npm install

# First try Gulp, then try Grunt
if [ -f "gulpfile.js" ]
then 
  npm install -g gulp-cli
  echo "Running Gulp default task"
  sh -c "gulp $*"
elif [ -f "Gruntfile.js" ]
then 
  npm install -g grunt-cli
  echo "Running Grunt default task"
  sh -c "grunt $*"
else
  echo "Neither Gruntfile nor gulpfile found. Nothing to execute."
fi
