# !/bin/bash

# verify_tools.sh

#-------------------------------------------------
#-- VERIFY IF ALL TOOLS ARE CORRECTLY INSTALLED --
#-------------------------------------------------

apt-get update && apt-get dist-upgrade -y
echo 'Version de Java'
sudo whereis java && java --version
echo 'Version de Maven'
sudo whereis maven && maven --version
echo 'Version de mvn'
sudo whereis mvn && mvn --version
echo 'Version de Docker'
sudo whereis docker && docker --version
echo 'Version de Docker Compose'
sudo whereis docker-compose && docker-compose --version
echo 'Version de NPM'
sudo whereis npm && npm --version
echo 'Version de NODE'
sudo whereis node && node --version
echo 'Version de NODEJS'
sudo whereis nodejs && nodejs --version
echo 'Version de GIT'
sudo whereis git && git --version
