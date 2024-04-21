#!/bin/bash

# Définition du répertoire de backup
backup_dir="oken_cars_backup"

# Création du nom du backup avec la date et l'heure actuelles
date_du_backup=$(date +%Y-%m-%d_%H-%M-%S)
backup_file="oken-cars-$date_du_backup.tar.gz"

# Création de l'archive de backup
tar -czvf "$backup_dir/$backup_file" oken_cars_backup/
