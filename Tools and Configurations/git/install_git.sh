# !/bin/bash

# install_git.sh

#-----------------------------
#-- INSTALL GIT -- VERSION  --
#-----------------------------

# Mettre à jour la distribution
sudo apt-get update && sudo apt-get upgrade -y

# Installer Git
sudo apt-get install git

# Vérifier la version de Git installée
git --version
