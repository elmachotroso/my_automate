#!/usr/bin/env bash

# auto installation of softwares for mac m1*

set -e

# install rosetta 2 if not exist
ROSETTA2_FILE1="/Library/Apple/usr/share/rosetta/rosetta"
ROSETTA2_FILE2="/Library/Apple/System/Library/Receipts/com.apple.pkg.RosettaUpdateAuto.bom"
ROSETTA2_FILE3="/Library/Apple/System/Library/Receipts/com.apple.pkg.RosettaUpdateAuto.plist"
if [ ! -f "${ROSETTA2_FILE1}" ] || [ ! -f "${ROSETTA2_FILE2}" ] || [ ! -f "${ROSETTA2_FILE3}" ]; then
    echo "Installing Rosetta 2..."
    /usr/sbin/softwareupdate --install-rosetta --agree-to-license
fi
echo "Rosetta 2 already installed."

# get homebrew
HBREW_BIN=$(lib_bash/get_homebrew.sh)
if [ -z "${HBREW_BIN}" ]; then
    echo "Failed to install homebrew"
    exit 1
fi
echo "Homebrew found in ${HBREW_BIN}"

set -x

brew tap homebrew/cask-versions

# install priority 1
brew install python3
brew install --cask rectangle
brew install --cask atom
brew install --cask visual-studio-code
brew install --cask firefox

# install priority 2
brew install --cask appcleaner
brew install --cask keka
brew install --cask vlc
brew install --cask movist
brew install --cask transmission
brew install --cask thunderbird
brew install --cask handbrake
brew install --cask audacity
brew install --cask spotify
brew install --cask gimp
brew install --cask libreoffice

# install priority 3
brew install gcc
brew install --cask cocoapods
brew install --cask beyond-compare
brew install --cask google-chrome
brew install --cask slack
brew install --cask microsoft-teams
brew install --cask github
brew install --cask visual-studio
brew install --cask unity-hub
brew install --cask android-studio
#brew install --cask virtualbox #not ARM ready
brew install --cask utm
brew install --cask docker
brew install --cask postman

# install priority 4
brew install --cask obs
brew install --cask blender

set +x

# App store only
echo
echo "You may want to open up App Store and get the following:"
echo "- Amphetamine"
echo "- Xcode"
echo "- DaVinci Resolve"
echo

# install python3 libraries
PY3_BIN=$(lib_bash/get_python3.sh)
if [ -z "${PY3_BIN}" ]; then
    echo "Failed to retrieve Python 3"
    exit 1
fi
echo "Python 3 found in ${PY3_BIN}"
echo "Installing Python 3 modules..."
"${PY3_BIN}" -m pip install --upgrade pip
"${PY3_BIN}" -m pip install -r requirements.txt

echo
echo "All steps executed."