#!/bin/bash

echo "Mazoni Environment Script!"
echo "Choose [u] for Ubuntu and [d] for Debian:"

read input

sudo apt update
sudo apt install git curl fish wget -y

# fish
mkdir ~/.config/fish
curl -o ~/.config/fish/config.fish https://raw.githubusercontent.com/MMazoni/configuration-files/master/.config/fish/config.fish
sudo chsh -s $(which fish) $USER

# github
git config --global user.name "Matheus Mazoni"
git config --global user.email "mmazoni.andrade@gmail.com"
git config --global core.editor vim
ssh-keygen -t rsa -b 4096 -C "mmazoni.andrade@gmail.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
sshcode=`cat ~/.ssh/id_rsa.pub`
echo $sshcode

