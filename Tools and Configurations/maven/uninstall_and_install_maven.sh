#!/bin/bash

# uninstall_and_install_maven

#--------------------------------------
# VM 411 et 412 -- 12th OCTOBER 2023
#--------------------------------------

#-------------------------
#---- UNINSTALL MAVEN -----
#-------------------------

# Afficher la version actuelle de Maven
mvn --version

# Supprimer Maven avec différentes méthodes
sudo apt-get remove maven
sudo apt-get purge maven
sudo apt remove maven
sudo apt purge maven
sudo apt-get remove --auto-remove maven
sudo apt remove --auto-remove maven
sudo apt-get purge --auto-purge maven
sudo apt purge --auto-purge maven

# Supprimer les paquets résiduels
dpkg -l | grep ^rc | awk java
dpkg -l | grep ^rc | awk maven

# Supprimer les répertoires et fichiers de configuration de Maven
sudo bash -c 'ls -d /home/*/.maven' | xargs sudo rm -rf
sudo bash -c 'ls -d /home/*/.mvn' | xargs sudo rm -rf
sudo bash -c 'ls -d /home/.mvn' | xargs sudo rm -rf
sudo bash -c 'ls -d /home/.maven' | xargs sudo rm -rf
sudo rm -rf mvn/
sudo rm -rf /usr/lib/mvn/*

# Désactiver les alternatives Java et Maven
sudo update-alternatives --display java
sudo update-alternatives --display mvn
sudo update-alternatives --display maven

# Supprimer les liens symboliques de Maven
ls /usr/bin/
ls /usr/bin/mvn*
sudo update-alternatives --remove "mvn" "/usr/bin/mvn/*"
ls /usr/bin/mvn*
sudo update-alternatives --remove "mvn" "/usr/bin/mvn/*"
sudo update-alternatives --remove "mvn" "/usr/bin/maven/*"

# Supprimer les fichiers liés à Maven
ls /bin/ | mvn
ls /bin/ | maven
sudo rm -rf /opt/apache-maven-3.9.4-bin.tar.gz
sudo rm -rf /opt/mvn/
ls /bin/ | mvn
sudo rm -rf /bin/mvn/
sudo rm -rf /bin/maven/


#-------------------------------
#---- INSTALL MAVEN 3.9.4 ------
#-------------------------------

# Vérifier si Maven est déjà installé
dpkg --list | grep mvn
dpkg --list | grep maven
apt-cache search maven

# Mettre à jour le système
sudo apt-get update && sudo apt-get upgrade

# Télécharger Apache Maven 3.9.4
wget https://dlcdn.apache.org/maven/maven-3/3.9.4/binaries/apache-maven-3.9.4-bin.tar.gz -P /opt

# Extraire Apache Maven
sudo tar -xvzf /opt/apache-maven-*.tar.gz/opt/apache-maven-*.tar.gz

# Créer un lien symbolique vers le répertoire d'installation de Maven
sudo ln -s /opt/apache-maven-3.9.4 /opt/mvn

# Ajouter les variables d'environnement à maven.sh
sudo echo "

# Variables d'environnement
export JAVA_HOME=/usr/lib/jvm/"java-17-openjdk-amd64"
export M2_HOME=/opt/mvn
export M2=/opt/mvn/bin
export MAVEN_HOME=/opt/mvn

# Variables d'environnement spécifiques à l'utilisateur
export PATH=${M2_HOME}/bin:${PATH}:
export PATH=$PATH:$HOME:/bin:$JAVA_HOME:$M2_HOME:$M2
export PATH

" >> /etc/profile.d/maven.sh

# Donner les permissions d'exécution à maven.sh
sudo chmod +x /etc/profile.d/maven.sh

# Charger les variables d'environnement
source /etc/profile.d/maven.sh

# Vérifier la version de Maven
mvn --version

# Supprimer le fichier tar.gz téléchargé
rm -rf /opt/apache-maven-*.tar.gz
