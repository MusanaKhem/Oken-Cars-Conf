# #!bin/bash

#------------------------------------
#-- INSTALL MAVEN -- VERSION 3.9.4 --
#------------------------------------

apt-get update && apt-get upgrade -y
apt install maven

wget https://dlcdn.apache.org/maven/maven-3/3.9.4/binaries/apache-maven-3.9.4-bin.tar.gz -P /tmp
mv /tmp/apache-maven-3.9.4-bin.tar.gz /tmp/maven.tar.gz
tar -xvzf /tmp/maven.tar.gz  -C /opt/
ln -s /opt/maven-3.9.4 /opt/maven-3.9.4
nano /etc/profile.d/maven.sh
chmod +x /etc/profile.d/maven.sh
source /etc/profile.d/maven.sh
mvn --version
whereis maven
whereis mvn
mvn --version

