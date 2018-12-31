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
  echo "Running Gulp with args"
  sh -c "gulp $*"
elif [ -f "Gruntfile.js" ]
then 
  npm install -g grunt-cli
  echo "Running Grunt with args"
  sh -c "grunt $*"
else
  echo "Running NPM with args"
  sh -c "npm $*"
fi
