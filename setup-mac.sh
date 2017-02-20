#!/bin/bash

# Prior to running this ensure the following are installed:
#   Xcode, iTerm 2

cd $HOME

echo "OSX: disable dashboard"
defaults write com.apple.dashboard mcx-disabled -boolean YES; killall Dock
echo "OSX: always show hidden files"
defaults write com.apple.finder AppleShowAllFiles TRUE; killall Finder

echo "install homebrew"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew doctor
brew update

echo "install brew apps"
brew install nvim git ag tree gpg2 ctags-exuberant mercurial openssl python unzip stow glide

echo "bew install standard gnu utils"
# The --default-names option will prevent Homebrew from prepending a g to each of the newly installed commands
brew tap homebrew/dupes
brew install coreutils
brew install binutils
brew install diffutils
brew install ed --with-default-names
brew install findutils --with-default-names
brew install gawk
brew install gnu-indent --with-default-names
brew install gnu-sed --with-default-names
brew install gnu-tar --with-default-names
brew install gnu-which --with-default-names
brew install gnutls
brew install grep --with-default-names
brew install gzip
brew install make
brew install watch
brew install wdiff --with-gettext
brew install wget


echo "setup dotfiles"
git clone git@github.com:sym3tri/dotfiles.git
cd $HOME/dotfiles
stow bash
stow git
stow nvim
stow psql
stow terraform

# GOLANG
#mkdir $HOME/.vim/ftdetect
#ln -s $GOROOT/misc/vim/ftdetect/gofiletype.vim $HOME/.vim/ftdetect/
#mkdir $HOME/.vim/syntax
#ln -s $GOROOT/misc/vim/syntax/go.vim $HOME/.vim/syntax
#mkdir $HOME/.vim/autoload
#ln -s $GOROOT/misc/vim/autoload/go/complete.vim $HOME/.vim/autoload/go

./go-get.sh
