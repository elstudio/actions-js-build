#!/bin/sh

set -e

echo "Installing NPM dependencies"
cd $WD_PATH
npm install

# First try Gulp, then try Grunt
if [ -f "gulpfile.js" ]
  then 
    npm install -g gulp-cli
    echo "Running Gulp default task"
    gulp
elif [ -f "Gruntfile.js " ]
  then 
    npm install -g grunt-cli
    echo "Running Grunt default task"
    grunt
else
  echo "Neither Gruntfile nor gulpfile found. Nothing to execute."
fi
