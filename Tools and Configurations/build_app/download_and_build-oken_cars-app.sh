# !/bin/bash

# download_and_build-oken_cars-app.sh

echo "--------------------------------------------------------------------------"
echo "---- CLEAN EVERY MODULES BEFORE INSTALL SKIPPING TESTS ----"
echo "--------------------------------------------------------------------------"

git clone ssh://git@10.10.10.212:2222/oken-consulting/oken-cars-web.git
cd oken-cars-web/spring/
mvn clean install -DskipTests
cd
echo "------------------------------------"
echo "---- BUILD OKEN CARS APP  ----"
echo "------------------------------------"
cd
cd oken-cars-web/
docker-compose up -d
echo "----------------------------------------------------------------"
echo "---- VERIFY IF ALL IS INSTALLED AND WORKING FINE  ----"
echo "----------------------------------------------------------------"
docker images
docker volume ls
docker ps
echo "------------------------------"
echo "---- END OF 3RD STEP  ----"
echo "----------------------
