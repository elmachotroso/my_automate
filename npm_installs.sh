#!/usr/bin/env bash

set -e

# detect presence of npm

WHICH_NPM=$(which npm)
if [ ! -x "$WHICH_NPM" ]; then
    echo "npm not found / cannot execute. Please install nodejs."
    exit 1
fi

echo "Performing npm installs..."

# crypto stuff
#npm install -g truffle
#npm audit fix --force

set +e

echo
echo "Finished npm installs."