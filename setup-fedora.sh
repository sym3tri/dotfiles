#!/bin/bash -e

# NOTES: this should be idempoent
# may need to run the following commands to get yubikey working
#  sudo pkill scadeamon
#  sudo pkill gpg-agent

echo "running fedora setup..."

# yum repo for google chrome
echo "setup yum repos"
cat << EOF > ./google-chrome.repo
[google-chrome]
name=google-chrome - \$basearch
baseurl=http://dl.google.com/linux/chrome/rpm/stable/\$basearch
enabled=1
gpgcheck=1
gpgkey=https://dl-ssl.google.com/linux/linux_signing_key.pub
EOF

sudo mv google-chrome.repo /etc/yum.repos.d/

# setup RPM Fusion
sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

echo "dnf install apps"
sudo dnf install -y neovim
sudo dnf install -y xsel # so system clipboard works with vim
sudo dnf install -y google-chrome-stable
sudo dnf install -y htop
sudo dnf install -y powertop
sudo dnf install -y paperkey
sudo dnf install -y stow
sudo dnf install -y mercurial
sudo dnf install -y gnome-tweak-tool
#sudo dnf install nautilus-dropbox
sudo dnf install -y ShellCheck
sudo dnf install -y arandr
sudo dnf install -y qemu
sudo dnf install -y the_silver_searcher tmux
# gpg stuff
sudo dnf install -y gnupg2 cryptsetup paperkey
# yubkikey tools
sudo dnf install -y ykclient ykpers libykneomgr
#smart card deps
sudo dnf install -y pcsc-tools opensc ccid gnupg2-smime

stow bash
stow git
stow nvim
stow psql
stow terraform

# enable GPG ssh support
mkdir -p ~/.gnupg
touch ~/.gnupg/gpg-agent.conf
echo enable-ssh-support > ~/.gnupg/gpg-agent.conf

# python tools
source ~/.bashrc
sudo pip install --upgrade pip
pip install --upgrade --user awscli

# GO
source ~/.bashrc
wget https://storage.googleapis.com/golang/go1.8.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.8.linux-amd64.tar.gz
rm go1.8.linux-amd64.tar.gz

./go-get.sh
