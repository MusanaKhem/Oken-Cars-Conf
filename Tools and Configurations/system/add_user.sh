# §/bin/bash

#----------------------------------
#- => USER AND GROUPS MANAGEMENT --
#----------------------------------

# Vérifier les informations d'identification de l'utilisateur actuel
id $USER

# Ajouter un nouvel utilisateur avec la commande adduser
sudo adduser oken
# Remplacez "oken" par le nom de l'utilisateur que vous souhaitez ajouter.

# Ajouter un nouvel utilisateur avec la commande useradd
sudo useradd -m -s /bin/bash oken
# Cette commande crée un nouvel utilisateur "oken" avec un répertoire personnel et définit le shell par défaut sur bash.

# Créer un nouveau groupe avec la commande addgroup
addgroup oken
# Cette commande crée un nouveau groupe portant le nom de l'utilisateur "oken". 

# Ajouter un utilisateur à un groupe avec la commande adduser
adduser oken oken
# Cette commande ajoute l'utilisateur "oken" au groupe "oken".

# Ajouter l'utilisateur au groupe sudo pour accorder des privilèges sudo
sudo usermod -aG sudo oken
# Cela permet à l'utilisateur "oken" d'exécuter des commandes avec élévation des privilèges en utilisant sudo.
