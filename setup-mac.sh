#!/bin/bash

# Prior to running this ensure the following are installed:
#   Xcode, iTerm 2, Golang

echo "running OSX setup..."

# see http://www.defaults-write.com
#echo "OSX: Disable dashboard"
#defaults write com.apple.dashboard mcx-disabled -boolean YES
echo "OSX: Always show hidden files in Finder"
defaults write com.apple.finder AppleShowAllFiles TRUE
echo "OSX: Display file extensions in Finder"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
echo "OSX: Display full posix path in OS X Finder title Bar"
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
echo "OSX: Change default view style in Finder to List View"
defaults write com.apple.Finder FXPreferredViewStyle Nlsv
echo "OSX: Disable animations when opening and closing windows"
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false
echo "OSX: Make all Mission Control animations faster"
defaults write com.apple.dock expose-animation-duration -float 0.1
echo "OSX: disable shadows on screenshots"
defaults write com.apple.screencapture disable-shadow -bool true
echo "OSX: Enable debug menu in Disk Utility"
defaults write com.apple.DiskUtility DUDebugMenuEnabled -bool true
echo "OSX: Disable new disks requests for Time Machine"
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true
echo "OSX: Disable Dock animations"
defaults write com.apple.dock launchanim -bool false

killall Dock
killall Finder


echo "install homebrew"
if ! [ -x "$(command -v brew)" ]; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew doctor
    brew update
fi
brew update

echo "install brew apps"
brew install neovim
brew install git
brew install fzf
#brew install the_silver_searcher
#brew install tree
#brew install gpg2
#brew install mercurial
#brew install openssl
brew install stow
brew install ShellCheck
brew install jq
brew install ShellCheck
brew upgrade `brew outdated`

echo "brew install standard gnu utils"
# The --default-names option will prevent Homebrew from prepending a g to each of the newly installed commands
brew tap homebrew/dupes
brew install coreutils
brew install binutils
brew install diffutils
brew install ed
brew install findutils
brew install gawk
brew install gnu-indent
brew install gnu-sed
brew install gnu-tar
brew install gnu-which
brew install gnutls
brew install grep
brew install gzip
brew install make
brew install watch
brew install wdiff --with-gettext
brew install wget
# beets plugins
brew install ffmpeg
brew install chromaprint

echo "setup dotfiles"
stow bash
stow git
stow nvim
#stow psql

source ~/.bashrc

# python tools (mostly for beets)
pip install --upgrade --user beets
pip install --upgrade --user discogs-client
pip install --upgrade --user pyacoustid
pip install --upgrade --user requests
pip install --upgrade --user pylast
pip install --upgrade --user requests_oauthlib

./go-get.sh

echo "done"
