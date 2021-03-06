#!/bin/bash -e

# Source global definitions
if [ -f /etc/bashrc ]; then
    source /etc/bashrc
fi

export HISTFILESIZE=3000

if [ -f ~/.bash_private_stuff ]; then
    source ~/.bash_private_stuff
fi

# Python
export PYTHONUSERBASE=~/.local
PATH=$PATH:$PYTHONUSERBASE/bin

# Go
export GOPATH=$HOME/dev/go
PATH=$PATH:/usr/local/go/bin
PATH=$PATH:~/usr/local/bin
PATH=$PATH:~/usr/local/bin/rkt
PATH=$PATH:$GOPATH/bin

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
alias kc='kubectl'
alias rkt='/sbin/rkt'

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
GPG_TTY=$(tty)
export GPG_TTY
# Use GPG agent instead of default ssh agent.
# From gpg-agent man page:
unset SSH_AGENT_PID
export SSH_AUTH_SOCK
SSH_AUTH_SOCK=$(gpgconf --list-dirs | awk 'BEGIN {FS=":"} /^agent-socket:/ {print $2 ".ssh"}')

# FZF
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# NVM
export NVM_DIR="/home/ed/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"  # This loads nvm

# kubectl
source ~/bash_completions/kubectl

# beets
if [ -d /Volumes/2TB/audio/beets/master ]; then
    export BEETSDIR=/Volumes/2TB/audio/beets/master
fi

# Platform specific stuff
unamestr=$(uname)
if [[ "$unamestr" == 'Darwin' ]]; then
    source ~/.bashrc_mac
else
    alias open='xdg-open'
fi
