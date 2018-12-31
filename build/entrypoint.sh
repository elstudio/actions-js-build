#!/bin/sh

set -e

if [ -n "$WD_PATH" ]
then
  echo "Changing dir to $WD_PATH"
  cd $WD_PATH
fi

echo "Installing NPM dependencies"
npm install

# Install and run JavaScript build tools.
# First try Gulp, then try Grunt. Default to npm.
if [ -f "gulpfile.js" ]
then 
  npm install -g gulp-cli
  if [ "$*" = "--help" ]
  then
    # List the gulp tasks available, then exit with a config error.
    # This gives the user info about the args available, but also 
    # lets them know we haven't really done anything.
    # See https://developer.github.com/actions/creating-github-actions/accessing-the-runtime-environment/#exit-codes-and-statuses
    sh -c "gulp --tasks" && exit 78
  else
    echo "Running gulp with args"
    sh -c "gulp $*"
  fi
elif [ -f "Gruntfile.js" ]
then 
  npm install -g grunt-cli
  echo "Running grunt with args"
  sh -c "grunt $*"
else
  if [ "$*" = "--help" ]
  then
    # List the npm scripts available, then exit with a config error.
    sh -c "npm run" && exit 78
  else
    echo "Running npm with args"
    sh -c "npm $*"
  fi
fi
