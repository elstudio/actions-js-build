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
# Gulpfile.js can be a file or a directory:
if [ -e "gulpfile.js" ]
then 
  npm install -g gulp-cli
  echo "Running Gulp with args"
  sh -c "gulp $*"
# Gruntfile can be js or coffeescript file
elif [ -f "Gruntfile.js" -o -f "Gruntfile.coffee" ]
then 
  npm install -g grunt-cli
  echo "Running Grunt with args"
  sh -c "grunt $*"
else
  echo "Running NPM with args"
  sh -c "npm $*"
fi
