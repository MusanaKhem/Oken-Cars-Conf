#  oken-cars-build.sh

#!bin/sh
echo "==================================="
echo "==== STAGE 1 - SERVER CONFIGURATION ===="
# Check Server Hostname
hostname
Hostnamectl
# Check IP address, Internet and SonarQube console access (IPv4)
ip -4 a | grep ens18
ping -c2 8.8.8.8
ping -c2 10.10.10.20:9000
# Check server firewall's status
sudo ufw status
# Check firewall' rules status
sudo ufw status numbered
# Check user location on the server
pwd
# Check user groups
id oken
# Check installed tools
# Check git version
git --version
# Check java version
java --version
# Check maven version
mvn --version
# Check node version
node -v
# Check npm version
npm -v
# Check docker version
docker --version
# Check docker compose version
docker compose version
# Display Path environment variable
echo $PATH
echo "==========================================="
echo "==== STAGE 2 - CLONE GITLAB REPOSITORY ===="
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
echo "==== STAGE 3 - GENERATE ARTEFACT ===="
# Change directory
cd spring/
# Check main files and folders
ls -lt
# Generate artefact
mvn clean install -DskipTests
echo "========================================"
echo "==== STAGE 4 - BUILD OKEN CARS APPLICATION ===="
# Go to project's main files and folders
cd  ../
# Check main files and folders
pwd && ls -lt
# Build App
docker compose up -d
echo "======================================"
echo "==== STAGE 5 - CHECK INSTALLATION ===="
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
# Check Docker volumes
docker volumes
# Check Docker launched containers
docker ps | grep apache
docker ps | grep angular
docker ps | grep spring

