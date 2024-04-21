# !/bin/bash

#-------------------------------------
#-- => CHANGE HOSTNAME IF NECESSARY --
#-------------------------------------


# Vérifier le nom de la machine
hostname
cat /etc/hostname

# Vérifier le fichier /etc/hosts
cat /etc/hosts

# Vérifier le nom de la machine
sudo hostname oken-cars.oken.lan
# Vérifier le nom de la machine
hostname

# Ajouter l'IP et le nom de la machine au fichier /etc/hosts
sudo echo '10.1.100.11 oken-cars.oken.lan' >> /etc/hosts

# Changer le nom de la machine (hostname) définitivement par /etc/hostname
# Modifier le fichier /etc/hostname
sudo echo 'oken-cars.oken.lan' > /etc/hostname

# Changer le nom de la machine (hostname) définitivement avec hostnamectl
# Configurer le hostname en ligne de commande
sudo hostnamectl set-hostname dockerserver

# Appliquer les modifications sans redémarrer le serveur ou la vm distante
invoke-rc.d hostname.sh restart

# Vérifier le nom de la machine
hostname
