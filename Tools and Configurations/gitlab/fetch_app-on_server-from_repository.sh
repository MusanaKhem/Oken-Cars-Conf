# !/bin/bash

# fetch_app-on_server-from_repository.sh

#=============================================================================
# WHEN THE REPOSIRTORY IS ALREADY CLONED ON 10.10.10.31 DEPLOYMENT SERVER
#=============================================================================


echo "---- STAGE 1 - WHEN GITLAB REPOSITORY ALREADY EXIST ON THE SERVER ----"
ls -lt
cd oken-cars-web/
git branch && git checkout develop
git fetch
git pull
echo "--------------------------------------------"
echo "---- STAGE 2 - GENERATE ARTEFACT ----"
ls -lt
cd spring/ && mvn clean install -DskipTests
echo "----------------------------------------------"
echo "---- STAGE 3 - CHECK DOCKER ACTUALLY USES ----"
ls -lt
systemctl status docker | grep Loaded
systemctl status docker | grep Active
docker images | grep oken-cars-web-apache
docker images | grep oken-cars-web-angular
docker images | grep oken-cars-web-spring
docker volumes
