# /bin/bash

# install_docker_compose.sh

#----------------------------------------------
#-- INSTALL DOCKER-COMPOSE -- VERSION 2.18.1 --
#----------------------------------------------

# Mettre à jour les packages disponibles et effectuer une mise à niveau du système
sudo apt-get update && apt-get dist-upgrade -y

# Créer le répertoire pour les plugins CLI de Docker
sudo mkdir -p ~/.docker/cli-plugins/

# Télécharger docker-compose et le placer dans le répertoire des plugins CLI de Docker
sudo curl -SL https://github.com/docker/compose/releases/download/v2.18.1/docker-compose-linux-x86_64 -o ~/.docker/cli-plugins/docker-compose

# Définir les autorisations appropriées pour que les commandes Docker Compose soient exécutables
chmod +x ~/.docker/cli-plugins/docker-compose

# Vérfier la version installée de Docker Compose
docker compose version

# Ajouter l'utilisateur actuel au groupe docker pour pouvoir exécuter Docker sans sudo
sudo sudo usermod -aG docker $USER
