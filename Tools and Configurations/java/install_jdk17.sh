# !/bin/bash

#  install_jdk17.sh

#------------------------------------
#-- INSTALL JAVA JDK -- VERSION 17 --
#------------------------------------

# Mettre à jour la distribution
sudo apt update && sudo apt upgrade -y

# Télécharger Java jdk
wget https://download.oracle.com/java/17/latest/jdk-17_linux-x64_bin.deb

# Installer Java jdk
sudo dpkg -i jdk-17_linux-x64_bin.deb

# Vérifier la version installée de Java jdk
java --version
