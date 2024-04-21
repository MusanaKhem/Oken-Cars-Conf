#!/bin/bash

# install_docker.sh

#--------------------------------------------
# Install Docker if not done in the app VM --
#--------------------------------------------

# Définir la variable DOCKER_CONFIG
DOCKER_CONFIG=${DOCKER_CONFIG:-$/usr/local/lib/docker/cli-plugins}

# Créer le répertoire pour Docker
mkdir -p /usr/local/lib/docker

# Créer le répertoire pour les plugins CLI de Docker
mkdir -p /usr/local/lib/docker/cli-plugins

# Télécharger docker-compose et le placer dans le répertoire des plugins CLI de Docker
curl -SL https://github.com/docker/compose/releases/download/v2.18.1/docker-compose-linux-x86_64 -o /usr/local/lib/docker/cli-plugins/docker-compose

# Vérifier que docker-compose est bien présent dans le répertoire des plugins CLI de Docker
ls /usr/local/lib/docker/cli-plugins

# Donner les permissions d'exécution à docker-compose
sudo chmod +x /usr/local/lib/docker/cli-plugins/docker-compose

# Vérifier à nouveau que docker-compose est bien présent dans le répertoire des plugins CLI de Docker
ls /usr/local/lib/docker/cli-plugins

##---> Set Up The Repository
# Installer les dépendances nécessaires pour ajouter le repository Docker
sudo apt-get install \
	 ca-certificates \
	 curl \
	 gnupg -y

# Ajouter la clé GPG de Docker au trousseau
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# Donner les permissions de lecture à la clé GPG de Docker
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Ajouter le repository Docker à la liste des sources de paquets
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Mettre à jour la liste des paquets disponibles
sudo apt-get update

# Installer les packages Docker
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

# Vérifier l'installation de Docker en exécutant une image hello-world
sudo docker run hello-world

# Installer les packages .deb et mettre à jour le PATH
sudo dpkg -i ./containerd.io_<version>_<arch>.deb \
   ./docker-ce_<version>_<arch>.deb \
   ./docker-ce-cli_<version>_<arch>.deb \
   ./docker-buildx-plugin_<version>_<arch>.deb \
   ./docker-compose-plugin_<version>_<arch>.deb

# Démarrer automatiquement le service Docker daemon
sudo service docker start

# Vérifier que l'installation de Docker est réussie en exécutant une image hello-world
sudo docker run hello-world

# Ajouter l'utilisateur au groupe sudo pour permettre l'utilisation de sudo
sudo usermod -aG sudo $USER
