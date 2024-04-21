#!/bin/bash

# auto-deploy-vm-git-java-mvn-docker.sh

set -e

# ENABLE TOOLS
UBUNTU=20.04.6 # Valeur prise en charge [ON, OFF]
UBUNTU_USER_NAME=rootokcw
UBUNTU_USER_PASSWORD=oken241!

GIT=ON # Valeur prise en charge [ON, OFF]
JAVA=17 # Valeur prise en charge [ON, OFF, X]
MAVEN=3.9.3 # Valeur prise en charge [ON, OFF, X.X.X]
DOCKER=24.0.2 # Valeur prise en charge [ON, OFF, X.X.X]

# Mise à jour des paquets disponibles et mise à niveau du système
apt-get update
apt-get upgrade -y

# Paramètres du clavier
apt-get install -y x11-xkb-utils
echo "setxkbmap fr" >> /home/proxmox/.bashrc
timedatectl set-timezone Europe/Paris
sed -i  "s/'de/'fr/g" /etc/xdg/autostart/input-source.desktop
sed -i  "s/'us/'fr/g" /etc/xdg/autostart/input-source.desktop

echo "------------------------------------------------------------------------------------"
echo "-------> L'INSTALLATION DES OUTILS VA COMMENCER. Souhaitez-vous continuer ? <-------"
echo "------------------------------------------------------------------------------------"

# Installation d'Ubuntu 20.04.6 LTS
case $UBUNTU in
  ON)
    # Ouvrir le shell d'administration
    open admin_shell
    # Vérifier les outils/machines utilisant WSL et vérifier si WSL est actif sur ces outils/machines
    wsl -l -v
    # Installer WSL en local
    wsl install
    # Indiquer le nom d'utilisateur
    echo $UBUNTU_USER_NAME
    # Indiquer le mot de passe de l'utilisateur
    echo $UBUNTU_USER_PASSWORD
    # Installer WSL sur la machine Ubuntu
    sudo apt install wsl
    # Indiquer le même nom d'utilisateur sur la machine Ubuntu
    echo $UBUNTU_USER_NAME
    # Indiquer le même mot de passe de l'utilisateur sur la machine Ubuntu
    echo $UBUNTU_USER_PASSWORD
    ;;
  OFF)
    echo "Skip Ubuntu installation"  
    ;;
  *)
    echo "Seules les valeurs ON et OFF sont prises en charge"
    ;;
esac

# Installation de GIT
case $GIT in
  ON)
    apt-get install -y git
    ;;
  OFF)
    echo "Skip Git installation"  
    ;;
  *)
    echo "Seules les valeurs ON et OFF sont prises en charge"
    ;;
esac

# Installation de JAVA
case $JAVA in
  ON)
    apt-get install default-jdk -y
    ;;
  OFF)
    echo "Skip Java installation"
    ;;
  *)
    echo "Installation de Java $JAVA"
    apt-get install openjdk-${JAVA}-jre -y
    ;;
esac

# Installation de Maven
case $MAVEN in
  ON)
    echo "Installation de Maven $MAVEN"
    # Télécharger Maven
    wget https://downloads.apache.org/maven/maven-3/${MAVEN}/binaries/apache-maven-${MAVEN}-bin.tar.gz
    # Extraire Maven
    tar zxvf apache-maven-${MAVEN}-bin.tar.gz
    # Déplacer Maven vers /opt
    mv apache-maven-${MAVEN} /opt/
    # Ajouter Maven au PATH
    echo "export PATH=/opt/apache-maven-${MAVEN}/bin:\$PATH" >> /etc/profile.d/maven.sh
    # Charger le fichier de configuration
    source /etc/profile.d/maven.sh
    # Vérifier l'installation de Maven
    mvn --version
    ;;
  OFF)
    echo "Skip Maven installation"
    ;;
  *)
    echo "Seules les valeurs ON et OFF sont prises en charge"
    ;;
esac

# Installation de Docker
case $DOCKER in
  ON)
    echo "Installation de Docker"
    # Télécharger le script d'installation de Docker
    curl -fsSL https://get.docker.com -o get-docker.sh && sh get-docker.sh
    # Ajouter l'utilisateur au groupe docker
    usermod -aG docker proxmox
    # Activer le démarrage automatique de Docker
    systemctl enable docker
    # Démarrer le service Docker
    systemctl start docker
    ;;
  OFF)
    echo "Skip Docker installation"
    ;;
  *)
    echo "Seules les valeurs ON et OFF sont prises en charge"
    ;;
esac

echo "##############"
echo "## VM ready ##"
echo "##############"
echo "Pour cette pile, vous utiliserez l'adresse IP $(ip -f inet addr show enp0s9 | sed -En -e 's/.*inet ([0-9.]+).*/\1/p')"
echo "La VM va redémarrer, veuillez patienter environ 2 minutes avant de vous connecter à la VM"
reboot
