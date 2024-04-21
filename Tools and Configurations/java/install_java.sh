# !/bin/bash

#----------------------------------------
#-- VM 411 et 412 -- 12th OCTOBER 2023 --
#----------------------------------------

#------------------------
#------------------------
#---- UNINSTALL JAVA ----
#------------------------
#------------------------

#----------------------
# UNINSTALL JAVA
#----------------------

# Remove all the Java related packages (Sun, Oracle, OpenJDK, IcedTea plugins, GIJ)
dpkg -l | grep ^rc | awk '{print($2)}' | xargs sudo apt-get -y purge


#----------------------
# UNINSTALL MVN
#----------------------

# Purge config files (careful. This command removed libsgutils2-2 and virtualbox config files too):
dpkg -l | grep ^rc | awk '{print($2)}' | xargs sudo apt-get -y purge


# Remove Java config and cache directory:
sudo bash -c 'ls -d /home/*/.java' | xargs sudo rm -rf


# Remove manually installed JVMs:
sudo rm -rf /usr/lib/jvm/*


# Remove Java entries, if there is still any, from the alternatives:
for g in ControlPanel java java_vm javaws jcontrol jexec keytool mozilla-javaplugin.so orbd pack200 policytool rmid rmiregistry servertool tnameserv unpack200 appletviewer apt extcheck HtmlConverter idlj jar jarsigner javac javadoc javah javap jconsole jdb jhat jinfo jmap jps jrunscript jsadebugd jstack jstat jstatd native2ascii rmic schemagen serialver wsgen wsimport xjc xulrunner-1.9-javaplugin.so; do sudo update-alternatives --remove-all $g; done


# Search for possible remaining Java directories:
sudo updatedb
sudo locate -b '\pack200'


# If the command above produces any output like /path/to/jre1.6.0_34/bin/pack200 remove the directory that is parent of bin, like this:
sudo rm -rf /path/to/jre1.6.0_34


# To completely remove OpenJDK on Ubuntu 11.10 (this may or may not be sufficient on other versions of Ubuntu), run:
sudo apt-get purge openjdk-\* icedtea-\* icedtea6-\*


#----------------------------------
# To uninstall Oracle Java 7,
#----------------------------------
sudo update-alternatives --display java


sudo update-alternatives --remove "java" "/usr/lib/jvm/jdk-17.*/bin/java"
sudo update-alternatives --remove "javac" "/usr/lib/jvm/jdk-17.*/bin/javac"
sudo update-alternatives --remove "javaws" "/usr/lib/jvm/jdk-17.*/bin/javaws"


# The next 2 commands must be type excatly perfectly to avoid permanently destroying your system.
cd /usr/lib/jvm/ && sudo rm -rf .jdk-*
Then do

sudo update-alternatives --config java
sudo update-alternatives --config javac
sudo update-alternatives --config javaws
Then do

sudo vi  /etc/environment
Delete the line with JAVA_HOME 1


#----------------------------------------------------
# To uninstall OpenJDK (if installed)              --
# First check which OpenJDK packages are installed --
#----------------------------------------------------
sudo dpkg --list | grep -i jdk

# To remove openjdk:

sudo apt-get purge openjdk*

# Uninstall OpenJDK related packages.

sudo apt-get purge icedtea-* openjdk-*

# Check that all OpenJDK packages have been removed.

sudo dpkg --list | grep -i jdk



===========================================================
===========================================================
===========================================================


#--------------------------------------------------
# INSTALL JAVA 17 openjdk (not jre)
#--------------------------------------------------

dpkg --list | grep java

apt-cache search java-17

sudo apt-get update && sudo apt-get upgrade

sudo apt list --installed | grep java

sudo apt install openjdk-17-jdk

ls -lt /usr/lib/jvm/ | grep *java*

which java

java --version
