#!/usr/bin/env bash

# downloads file via curl
# mounts the dmg
# copies the app
# unmount the dmg

# usage: install_dmg <url to dmg> <volume name>

set -e

USAGE="# usage: install_dmg <url to dmg>"
INSTALLED_CONTENT=""

DMG_URL="$1"
if [ -z "${DMG_URL}" ]; then
    echo "Empty DMG URL to download."
    echo "${USAGE}"
    exit 1
fi

VOL_NAME="$2"
if [ -z "${VOL_NAME}" ]; then
    echo "Empty expected volume name when mounted."
    echo "${USAGE}"
    exit 2
fi

DMG_FILE=$(basename "${DMG_URL}")
if [ -z "${DMG_FILE}" ]; then
    echo "Not a file to download: ${DMG_FILE}"
    echo "${USAGE}"
    exit 3
fi

if [ -f "/tmp/${DMG_FILE}" ]; then
    rm -rf /tmp/"${DMG_FILE}"
fi

echo "Downloading ${DMG_URL}..."
curl ${DMG_URL} --output /tmp/"${DMG_FILE}"
if [ ! -f "/tmp/${DMG_FILE}" ]; then
    echo "Failed to locate downloaded file in /tmp/${DMG_FILE}"
    exit 3
fi

hdiutil attach "/tmp/${DMG_FILE}"
ORIG_PATH=$(pwd)
cd "/Volumes/${VOL_NAME}"
APP_NAME=$(ls | grep *.app)
echo "Found ${APP_NAME}"
TARGET_DIR=$(eval echo "~/Applications/")
cp -R "/Volumes/${VOL_NAME}/${APP_NAME}" "${TARGET_DIR}"
cd "${ORIG_PATH}"
hdiutil detach "/Volumes/${VOL_NAME}"
rm "/tmp/${DMG_FILE}"
echo "${APP_NAME} installed in ${TARGET_DIR}"