#!/usr/bin/env bash

# downloads and installs homebrew

set -e

WHICH_BREW="$(which brew)"
if [ -x "${WHICH_BREW}" ]; then
    echo "${WHICH_BREW}"
    exit 0
fi

echo | bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" > /dev/null
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

WHICH_BREW=$(which brew)
if [ ! -x "${WHICH_BREW}" ]; then
    echo ""
    exit 1
fi

echo "${WHICH_BREW}"
exit 0
