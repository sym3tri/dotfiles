#!/bin/bash -e

# Source global definitions
if [ -f /etc/bashrc ]; then
    source /etc/bashrc
fi

export HISTFILESIZE=3000

# Homebrew Software
PATH=/opt/homebrew/bin:$PATH
PATH=/opt/homebrew/opt/python@3.11/libexec/bin:$PATH



# Python
PYTHONPATH="$(brew --prefix)/lib/python@3.11/site-packages"
export PYTHONPATH

#export PYTHONUSERBASE=~/.local
#PATH=$PATH:$PYTHONUSERBASE/bin
#export PATH="$HOME/.pyenv/bin:$PATH"

# Go
#export GOPATH=$HOME/dev/go
#PATH=$PATH:/usr/local/go/bin
#PATH=$PATH:~/usr/local/bin
#PATH=$PATH:$GOPATH/bin

export EDITOR=nvim

# GIT
if [ -e "/usr/share/git-core/contrib/completion/git-prompt.sh" ]; then
    source "/usr/share/git-core/contrib/completion/git-prompt.sh"
    export PS1='[\h \[\e[1;36m\]\W\[\e[m\]$(declare -F __git_ps1 &>/dev/null && __git_ps1 " \[\e[1;32m\](%s)\[\e[m\]")]\$ '
else
    export PS1='[\h \[\e[1;36m\]\W\[\e[m\]]\$ '
fi

alias c='clear'
alias vim=nvim
# allows aliases to work when using sudo
alias sudo='sudo '
alias grep='grep --color=always'
alias vimrc='vim $HOME/.config/nvim/init.vim'
alias bashrc='vim $HOME/.bashrc'
alias ..='cd ..'
alias ...='cd ../..'
alias cwd='pwd | xsel -b'

# GIT ALIASES
alias gs='git status -sb'
alias gc='git commit -m'
alias gco='git checkout'
alias gd='git diff'
alias gr='git rebase'
alias ga='git add'
alias gl='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)%Creset" --abbrev-commit'
alias gbd='git for-each-ref --sort=-committerdate refs/heads/ | less'
alias gpr='open "https://github.com/$(git_current_origin)/pull/new/$(git_current_branch)"'

# GPG

# FZF
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# NVM
export NVM_DIR="/Users/ed/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"  # This loads nvm

# beets
if [ -d /Volumes/2TB/audio/beets/master ]; then
    export BEETSDIR=/Volumes/2TB/audio/beets/master
fi

# Make sure colors show up in iTerm
export CLICOLOR=1
export LSCOLORS=dxfxcxdxbxegedabagacad
export TERM=xterm-256color

export BEETSDIR=/Volumes/extern/audio/beets/master

randpw(){ /usr/bin/openssl rand -base64 32; }
