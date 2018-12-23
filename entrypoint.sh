#!/bin/sh

set -e

# if [ -n "$NPM_AUTH_TOKEN" ]; then
#   # Respect NPM_CONFIG_USERCONFIG if it is provided, default to $HOME/.npmrc
#   NPM_CONFIG_USERCONFIG="${NPM_CONFIG_USERCONFIG-"$HOME/.npmrc"}"
#   NPM_REGISTRY_URL="${NPM_REGISTRY_URL-registry.npmjs.org}"

#   # Allow registry.npmjs.org to be overridden with an environment variable
#   printf "//$NPM_REGISTRY_URL/:_authToken=$NPM_AUTH_TOKEN\nregistry=$NPM_REGISTRY_URL" > "$NPM_CONFIG_USERCONFIG"
#   chmod 0600 "$NPM_CONFIG_USERCONFIG"
# fi


echo "Installing utilities."
apk update
apk add git
npm install -g grunt-cli gulp-cli

echo "Installing NPM dependencies."
cd $WD_PATH
npm install

echo "Compiling."
grunt

echo "Changed files."
git status
# sh -c "npm $*"
