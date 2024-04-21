# !/bin/bash

# install_docker_24.0.6.sh

#-------------------------------------------
#-- VERIFY IF THAT NO DOCKER IS INSTALLED --
#-------------------------------------------

sudo apt-get update && apt-get dist-upgrade -y

sudo apt-get install curl net-tools -y

sudo rm -rf /var/snap/docker/179/run/docker.pid

sudo apt remove docker docker-engine docker.io containerd runc


#--------------------------------------
#-- INSTALL DOCKER -- VERSION 24.0.6 --
#--------------------------------------

# Mettre à jour la liste des paquets disponibles et effectuer une mise à niveau du système
sudo apt-get update && apt-get dist-upgrade -y

# Télécharger le script d'installation de Docker
curl -fsSL https://get.docker.com -o get-docker.sh

# Afficher le contenu du répertoire actuel
ls

# Exécuter le script d'installation de Docker
sh get-docker.sh

# Vérifier la version de Docker installée
docker --version

# Vérifier la version de Docker Compose installée
docker-compose --version

# Activer le démarrage automatique du service Docker
systemctl enable docker.service

# Activer le démarrage automatique du service containerd
systemctl enable containerd.service

# Définir l'utilisateur Docker
DOCKER_USER="docker"

# Afficher l'utilisateur Docker
echo $DOCKER_USER

# Ajouter l'utilisateur Docker au groupe docker pour pouvoir exécuter Docker sans sudo
usermod -aG docker $DOCKER_USER

# Vérifier les conteneurs Docker en cours d'exécution
docker ps

# Passer au nouveau groupe docker pour appliquer les modifications sans se déconnecter
newgrp docker

# Vérifier le statut du service Docker
systemctl status docker

# Éditer le service Docker pour ajouter des options de démarrage
systemctl edit docker.service

# Remplacer la ligne ExecStart dans le fichier de service Docker
echo 'cf. /etc/systemd/system/docker.service'

# Vérifier à nouveau le statut du service Docker
systemctl status docker

# Recharger la configuration du gestionnaire de démarrage
systemctl daemon-reload

# Redémarrer le service Docker pour appliquer les modifications
systemctl restart docker.service

# Vérifier à nouveau le statut du service Docker
systemctl status docker

# Démarrer le service Docker
systemctl start docker

# Démarrer le démon Docker en arrière-plan
dockerd &

# Réinitialiser l'identifiant de la machine (nécessaire dans certains cas)
truncate -s 0 /etc/machine-id
