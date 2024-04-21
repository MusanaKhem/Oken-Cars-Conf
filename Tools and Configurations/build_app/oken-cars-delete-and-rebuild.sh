#!bin/sh
echo "==========================================="
echo "==== STAGE 1 - SERVER MAIN INFORMATION ===="
echo "==========================================="
# Check Server Hostname
hostname
hostnamectl
# Check IP address, Internet and SonarQube console access (IPv4)
ip -4 a | grep ens18
ping -c2 8.8.8.8
ping -c2 10.10.10.20:9000
ping oken-cars.oken.lan
ping oken-cars2.oken.lan
ping oken-cars3.oken.lan
# Check firewall' rules status
sudo ufw status numbered
# Check user location on the server
pwd
# Check user groups
id $USER
# Check if Docker is loaded and activated
systemctl status docker | grep Loaded
systemctl status docker | grep Active
# Check Docker launched images
docker images | grep oken-cars-web-apache
docker images | grep oken-cars-web-angular
docker images | grep oken-cars-web-spring
# Check Docker volumes
docker volumes
# Check Docker launched containers
docker ps | grep apache-app
docker ps | grep angular-app
docker ps | grep spring-app
echo "================================================="
echo "==== STAGE 2 - STOP AND DELETE OLD CONTAINER ===="
echo "================================================="
# Stop all containers which are running
docker stop apache-app
docker stop angular-app
docker stop spring-app
# Delete all containers which are running
docker rm apache-app
docker rm angular-app
docker rm spring-app
echo "====================================="
echo "==== STAGE 3 - DELETE OLD IMAGES ===="
echo "====================================="
# Delete all existing and/or running images
docker rmi -f oken-cars-web-apache:latest
docker rmi -f oken-cars-web-angular:latest
docker rmi -f oken-cars-web-spring:latest
docker rmi -f postgres:13
# Return to home directory and display user location on the server
cd && pwd
# Copy project server repo
backup_script="../backup_project_repertory.sh
# Appel du script de backup
bash "$backup_script"
# Delete project server repo
rm -Rf oken-cars-web
ls -alt oken-cars-web
echo "==========================================="
echo "==== STAGE 4 - CLONE GITLAB REPOSITORY ===="
echo "==========================================="
# Check main files and folders
ls -lt
# Clone distant repository
git clone --branch develop --single-branch ssh://git@10.10.10.212:2222/oken-consultin>
# Go to project's main files and folders
cd oken-cars-web/
# Check user branch position
git branch
# Go to develop branch
git checkout develop
# Check user branch position
git branch
echo "====================================="
echo "---- STAGE 5 - GENERATE ARTEFACT ----"
echo "====================================="
# Change directory
cd spring/
# Check main files and folders
ls -lt
# Generate artefact
mvn clean install -DskipTests
echo "==============================================="
echo "==== STAGE 6 - BUILD OKEN CARS APPLICATION ===="
echo "==============================================="
# Go to project's main files and folders
cd  ../
# Check main files and folders
pwd && ls -lt
# Build App
docker compose up -d
echo "======================================"
echo "==== STAGE 7 - CHECK INSTALLATION ===="
echo "======================================"
# Check user location and main files and folders
pwd && ls -lt
# Check if Docker is loaded
systemctl status docker | grep Loaded
# Check if Docker is activated
systemctl status docker | grep Active
# Check Docker launched images
docker images | grep oken-cars-web-apache
docker images | grep oken-cars-web-angular
docker images | grep oken-cars-web-spring
docker images | grep postgres:13
# Check Docker volumes
docker volumes
# Check Docker launched containers
docker ps | grep apache
docker ps | grep angular
docker ps | grep spring
