#!/bin/sh

# Prior to running this ensure the following are installed:
#   Xcode, ssh keys, zsh, iTerm 2

clear

cd $HOME

echo "OSX: disable dashboard"
defaults write com.apple.dashboard mcx-disabled -boolean YES; killall Dock

echo "OSX: always show hidden files"
defaults write com.apple.finder AppleShowAllFiles TRUE; killall Finder

echo "install homebrew"
ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"
brew doctor
brew update

echo "install brew apps"
brew install vim
brew install git
brew install node
brew install ag
brew install tree
brew install gpg
brew install ctags-exuberant

echo "setup dotfiles"
git clone git@github.com:sym3tri/dotfiles.git
cd $HOME/dotfiles
ln -s $HOME/dotfiles/git/gitignore_global $HOME/.gitignore_global
ln -s $HOME/dotfiles/vim/vimrc $HOME/.vimrc
ln -s $HOME/dotfiles/vim $HOME/.vim
ln -s $HOME/dotfiles/zsh/zshrc $HOME/.zshrc

echo "change shell to zsh"
chsh -s $(which zsh)

echo "vim plugins"
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vim +BundleInstall +qall

echo "node modules"
npm install -g simple
npm install -g bower
npm install -g grunt-cli
npm install -g express

