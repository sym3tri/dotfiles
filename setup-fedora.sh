#!/bin/bash

echo "setup yum repos"
sudo cat << EOF > /etc/yum.repos.d/google-chrome.repo
[google-chrome]
name=google-chrome - \$basearch
baseurl=http://dl.google.com/linux/chrome/rpm/stable/\$basearch
enabled=1
gpgcheck=1
gpgkey=https://dl-ssl.google.com/linux/linux_signing_key.pub
EOF

echo "dnf install apps"
sudo dnf install gnome-tweak-tool neovim google-chrome-stable htop powertop paperkey stow mercurial nautilus-dropbox ShellCheck arandr uznip quemu the_silver_searcher tmux

stow bash
stow git
stow nvim
stow psql
stow terraform

# GO
wget https://storage.googleapis.com/golang/go1.8.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.8.linux-amd64.tar.gz

./go-get.sh
