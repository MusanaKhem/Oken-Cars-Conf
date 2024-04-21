# !/bin/bash

# install_node.sh

#-------------------------------------
#-- INSTALL NODE -- VERSION 18.17.0 --
#-------------------------------------

sudo apt-get update && apt-get dist-upgrade -y
cd ~
sudo curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
sudo source ~/.bashrc
sudo nvm list-remote
sudo nvm install v18.17.0
sudo nvm list
sudo nvm use v18.17.0
sudo npm --version
sudo node --version

#---------------------------------------
#-- INSTALL NODEJS -- VERSION 18.17.0 --
#---------------------------------------

sudo apt-get update && apt-get dist-upgrade -y
cd ~
sudo nodejs --version

