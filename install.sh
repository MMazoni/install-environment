#!/bin/bash

echo "Mazoni Environment Script!"
echo "Choose [u] for Ubuntu and [d] for Debian:"

read input

sudo apt update
sudo apt upgrade -y
sudo apt install git curl fish wget -y

# fish
echo "Configuring fish..."
mkdir ~/.config/fish
curl -o ~/.config/fish/config.fish https://raw.githubusercontent.com/MMazoni/configuration-files/master/.config/fish/config.fish
sudo chsh -s $(which fish) $USER

# vim
echo "Configuring vim..."
curl -o ~/.vimrc https://raw.githubusercontent.com/MMazoni/configuration-files/master/.vimrc
curl -o ~/.vim/colors/atlantic-dark.vim https://raw.githubusercurrent.com/MMazoni/configuration-files/master/.vim/colors/atlantic-dark.vim --create-dirs

# github
echo "Configuring git..."
git config --global user.name "Matheus Mazoni"
git config --global user.email "mmazoni.andrade@gmail.com"
git config --global core.editor vim
ssh-keygen -t rsa -b 4096 -C "mmazoni.andrade@gmail.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
sshcode=`cat ~/.ssh/id_rsa.pub`
echo $sshcode
read -p "Press enter to continue"

# docker
echo "Installing docker..."
sudo apt remove docker docker-engine docker.io containerd runc -y
sudo apt install apt-transport-https ca-certificates curl gnupg lsb-release -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io -y
sudo groupadd docker
sudo usermod -aG docker $USER

# docker-compose
echo "Installing docker-compose..."
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# node
echo "Installing node and yarn..."
nodeversion="v14.17.3"
curl -o "$HOME/.node/node-$nodeversion-linux-x64.tar.xz" "https://nodejs.org/dist/$nodeversion/node-$nodeversion-linux-x64.tar.xz" --create-dirs
tar -xvf "$HOME/.node/node-$nodeversion-linux-x64.tar.xz" -C ~/.node/
rm "$HOME/.node/node-$nodeversion-linux-x64.tar.xz"
echo "set -x PATH \$HOME/.node/node-$nodeversion-linux-x64/bin/ \$PATH" >> ~/.config/fish/config.fish
source ~/.config/fish/config.fish
npm i -g yarn

