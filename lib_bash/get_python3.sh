#!/usr/bin/env bash

# tries to get correct python3 binary

set -e

WHICH_PYTHON3="$(which python3)"
if [ -x "${WHICH_PYTHON3}" ]; then
    echo "${WHICH_PYTHON3}"
    exit 0
fi

# determine if python command is indeed python 3, not 2
WHICH_PYTHON3=$(which python)
if [ ! -x "${WHICH_PYTHON3}" ]; then
    PYTHON3_PATTERN='^Python 3\..*'
    PYTHON_VER=$(python --version)
    if [[ "${PYTHON_VER}" =~ $PYTHON3_PATTERN ]]; then
        echo ""
        exit 1
    fi
fi

echo "${WHICH_PYTHON3}"
exit 0
