#!/bin/bash
# install_maven-3.9.4.sh

# Mettre à jour les packages et effectuer une mise à niveau
sudo apt-get update && apt-get upgrade -y

# Télécharger Apache Maven 3.9.4 dans le répertoire /opt
sudo wget https://dlcdn.apache.org/maven/maven-3/3.9.4/binaries/apache-maven-3.9.4-bin.tar.gz -P /opt

# Renommer le fichier téléchargé en tant que maven-3.9.4.tar.gz
sudo mv /opt/apache-maven-3.9.4-bin.tar.gz /opt/maven-3.9.4.tar.gz

# Extraire le contenu du fichier tar.gz dans /opt/maven-3.9.4
sudo tar -xvzf /opt/maven-3.9.4.tar.gz -C /opt/maven-3.9.4

# Créer un fichier de configuration pour Maven
sudo touch /etc/profile.d/maven-3.9.4.sh

# Ajouter les variables d'environnement pour Java et Maven dans le fichier de configuration
sudo echo "export JAVA_HOME=/usr/lib/jvm/java-1.17.0-openjdk-amd64" >> /etc/profile.d/maven-3.9.4.sh
sudo echo "export M2_HOME=/opt/maven-3.9.4" >> /etc/profile.d/maven-3.9.4.sh
sudo echo "export PATH=\${M2_HOME}/bin:\${PATH}" >> /etc/profile.d/maven-3.9.4.sh

# Donner les permissions d'exécution au fichier de configuration
sudo chmod +x /etc/profile.d/maven-3.9.4.sh

# Charger les variables d'environnement définies dans le fichier
source /etc/profile.d/maven-3.9.4.sh

# Créer un fichier .bash_profile s'il n'existe pas déjà
sudo touch ~/.bash_profile

# Ajouter les variables d'environnement au fichier .bash_profile
sudo echo "export JAVA_HOME=/usr/lib/jvm/java-1.17.0-openjdk-amd64" >> ~/.bash_profile
sudo echo "export M2_HOME=/opt/maven-3.9.4" >> ~/.bash_profile
sudo echo "export PATH=\${M2_HOME}/bin:\${PATH}" >> ~/.bash_profile

# Charger les variables d'environnement définies dans le fichier .bash_profile
source ~/.bash_profile

# Trouver l'emplacement de l'exécutable Maven
whereis maven

# Trouver l'emplacement de l'exécutable mvn
whereis mvn

# Vérifier la version de Maven
mvn --version

# Définir explicitement les variables d'environnement JAVA_HOME, M2_HOME, MAVEN_HOME et PATH
export JAVA_HOME=/usr/lib/jvm/java-1.17.0-openjdk-amd64
export M2_HOME=/opt/maven-3.9.4
export MAVEN_HOME=/opt/maven-3.9.4
export PATH=${M2_HOME}/bin:${PATH}

# Afficher le contenu de la variable PATH pour vérification
echo $PATH
