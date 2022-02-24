#!/usr/bin/env bash

# auto installation of softwares for mac m1*
# usage: sudo ./macos_arm64.sh

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
brew install wget
brew install git

## git-lfs - begin
brew install git-lfs
git lfs install
## git-lfs - end

## python 3 - begin
brew install python3
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
## python 3 - end

brew install mas
brew install --cask rectangle
brew install --cask atom
mas install 497799835 # Xcode
brew install --cask visual-studio-code
brew install --cask firefox

# install priority 2
mas install 937984704 # Amphetamine
brew install --cask appcleaner
brew install --cask keka
brew install --cask vlc
brew install --cask movist
brew install --cask zoom
brew install --cask transmission
brew install --cask thunderbird
brew install --cask handbrake
brew install --cask audacity
brew install --cask spotify
brew install --cask gimp
brew install --cask libreoffice

# install priority 3

## ccache - begin
brew install ccache
# prepend /opt/homebrew/opt/ccache/libexec
TEST_CCACHE="$(echo ${PATH} | grep 'ccache/libexec' )"
if [ -z "${TEST_CCACHE}" ]; then
    echo 'export PATH="/opt/homebrew/opt/ccache/libexec:${PATH}"' >> ~/.zprofile
    echo 'export PATH="/opt/homebrew/opt/ccache/libexec:${PATH}"' >> ~/.bash_profile
    echo 'export PATH="/opt/homebrew/opt/ccache/libexec:${PATH}"' >> ~/.profile
fi
## ccache - end

brew install gcc

## java - begin
brew install java11
ln -sfn /opt/homebrew/opt/openjdk@11/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-11.jdk
echo 'export PATH="/opt/homebrew/opt/openjdk@11/bin:$PATH"' >> ~/.zprofile
echo 'export CPPFLAGS="-I/opt/homebrew/opt/openjdk@11/include"' >> ~/.zprofile

echo 'export PATH="/opt/homebrew/opt/openjdk@11/bin:$PATH"' >> ~/.bash_profile
echo 'export CPPFLAGS="-I/opt/homebrew/opt/openjdk@11/include"' >> ~/.bash_profile

echo 'export PATH="/opt/homebrew/opt/openjdk@11/bin:$PATH"' >> ~/.profile
echo 'export CPPFLAGS="-I/opt/homebrew/opt/openjdk@11/include"' >> ~/.profile
## java - end

brew install imagemagick
brew install --cask dotnet-sdk
brew install --cask github
brew install --cask sourcetree
brew install --cask cocoapods
brew install --cask beyond-compare
brew install --cask google-chrome
brew install --cask slack
brew install --cask microsoft-teams
brew install --cask visual-studio
brew install --cask android-studio
brew install --cask unity-hub
brew install --cask epic-games
#brew install --cask virtualbox #not ARM ready
brew install --cask utm
brew install --cask docker
brew install --cask postman

# install priority 4
brew install --cask veracrypt
brew install --cask obs
brew install --cask blender
mas install 571213070 # DaVinci Resolve
./lib_bash/install_dmg.sh "https://cdn.cloudflare.steamstatic.com/client/installer/steam.dmg" "Steam"

set +x

echo
echo "All steps executed."