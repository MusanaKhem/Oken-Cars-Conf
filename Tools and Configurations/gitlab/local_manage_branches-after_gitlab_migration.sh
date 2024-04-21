#!/bin/bash

#-----------------------------------------------------------------------------
# JOB POUR NOMMINER LES BRANCHES DE CHACUN DES PROJETS/REPO D'OKEN EN LOCAL --
#-----------------------------------------------------------------------------
# Declare variables
#git_repo01="http://10.10.10.212/oken-consulting/diagrammokencars.git"
#local_repo01="diagrammokencars"
git_repo02="http://10.10.10.212/oken-consulting/infrastructure.git"
local_repo02="infrastructure"
git_repo03="http://10.10.10.212/oken-consulting/oat-training.git"
local_repo03="oat-training"
git_repo04="http://10.10.10.212/oken-consulting/oken-blog-test.git"
local_repo04="oken-blog-test"
git_repo05="http://10.10.10.212/oken-consulting/oken-cars.git"
local_repo05="oken-cars"
git_repo06="http://10.10.10.212/oken-consulting/oken-front.git"
local_repo06="oken-front"
git_repo07="http://10.10.10.212/oken-consulting/portfolio.git"
local_repo07="portfolio"
git_repo08="http://10.10.10.212/oken-consulting/spring-boot.git"
local_repo08="spring-boot"
git_repo09="http://10.10.10.212/oken-consulting/tamplate_corporate_website.git"
local_repo09="tamplate_corporate_website"
git_repo10="http://10.10.10.212/oken-consulting/tamplate_corporate_website2.git"
local_repo10="tamplate_corporate_website2"
git_repo11="http://10.10.10.212/oken-consulting/training.git"
local_repo11="training"
git_repo12="http://10.10.10.212/oken-consulting/training-dashboard.git"
local_repo12="training-dashboard"


#----------------------------
# MAKE THE JOB FOR REPO 01 --
#----------------------------
# Check if user is a the right place in is own system
#ls -alt
# Clone the repository
#git clone $git_repo01
# Go to the repository cloned
#cd $local_repo01
# Check if user is at the right place in is own system
#ls -alt
# Make "main" as the default branch in your local system
#git branch -M main
# Track main's local branch and make it associate with main's remote branch
#git push -uf origin main
# Create and go on "develop" branch
#git checkout -b develop
# Track develop's local branch and make it associate with develop's remote branch
#git push --set-upstream origin develop
# Create and go on "feature/develop" branch
#git checkout -b feature/develop
# Track feature/develop's local branch and make it associate with feature/develop's remote branch
#git push --set-upstream origin feature/develop
# Return to the default branch to create others branches
#git checkout main
# Create and go on "devops" branch
#git checkout -b devops
# Track devops's local branch and make it associate with devops's remote branch
#git push --set-upstream origin devops
# Return to the default branch to create others branches
#git checkout main
# Create and go on "hotfix" branch
#git checkout -b hotfix
# Track hotfix's local branch and make it associate with hotfix's remote branch
#git push --set-upstream origin hotfix
# Return to the default branch to create others branches
#git checkout main
# Create and go on "bugfix" branch
#git checkout -b bugfix
# Track bugfix's local branch and make it associate with bugfix's remote branch
#git push --set-upstream origin bugfix
# Return to the default branch to create others branches
#git checkout main
# Create and go on "test" branch
#git checkout -b test
# Track test's local branch and make it associate with test's remote branch
#git push --set-upstream origin test
# Return to the default branch to start working if you want
#git checkout develop
# See branches list. We are normally able to see if all branches were correctly created
#git branch -l
# Go out from the repo and return where all Oken repositories are placed on your own system
#cd ..


#----------------------------
# MAKE THE JOB FOR REPO 02 --
#----------------------------
# Check if user is a the right place in is own system
ls -alt
# Clone the repository
git clone $git_repo02
# Go to the repository cloned
cd $local_repo02
# Check if user is at the right place in is own system
ls -alt
# Make "main" as the default branch in your local system
git branch -M main
# Track main's local branch and make it associate with main's remote branch
git push -uf origin main
# Create and go on "develop" branch
git checkout -b develop
# Track develop's local branch and make it associate with develop's remote branch
git push --set-upstream origin develop
# Create and go on "feature/develop" branch
git checkout -b feature/develop
# Track feature/develop's local branch and make it associate with feature/develop's remote branch
git push --set-upstream origin feature/develop
# Return to the default branch to create others branches
git checkout main
# Create and go on "devops" branch
git checkout -b devops
# Track devops's local branch and make it associate with devops's remote branch
git push --set-upstream origin devops
# Return to the default branch to create others branches
git checkout main
# Create and go on "hotfix" branch
git checkout -b hotfix
# Track hotfix's local branch and make it associate with hotfix's remote branch
git push --set-upstream origin hotfix
# Return to the default branch to create others branches
git checkout main
# Create and go on "bugfix" branch
git checkout -b bugfix
# Track bugfix's local branch and make it associate with bugfix's remote branch
git push --set-upstream origin bugfix
# Return to the default branch to create others branches
git checkout main
# Create and go on "test" branch
git checkout -b test
# Track test's local branch and make it associate with test's remote branch
git push --set-upstream origin test
# Return to the default branch to start working if you want
git checkout develop
# See branches list. We are normally able to see if all branches were correctly created
git branch -l
# Go out from the repo and return where all Oken repositories are placed on your own system
cd ..


#----------------------------
# MAKE THE JOB FOR REPO 03 --
#----------------------------
# Check if user is a the right place in is own system
ls -alt
# Clone the repository
git clone $git_repo03
# Go to the repository cloned
cd $local_repo03
# Check if user is at the right place in is own system
ls -alt
# Make "main" as the default branch in your local system
git branch -M main
# Track main's local branch and make it associate with main's remote branch
git push -uf origin main
# Create and go on "develop" branch
git checkout -b develop
# Track develop's local branch and make it associate with develop's remote branch
git push --set-upstream origin develop
# Create and go on "feature/develop" branch
git checkout -b feature/develop
# Track feature/develop's local branch and make it associate with feature/develop's remote branch
git push --set-upstream origin feature/develop
# Return to the default branch to create others branches
git checkout main
# Create and go on "devops" branch
git checkout -b devops
# Track devops's local branch and make it associate with devops's remote branch
git push --set-upstream origin devops
# Return to the default branch to create others branches
git checkout main
# Create and go on "hotfix" branch
git checkout -b hotfix
# Track hotfix's local branch and make it associate with hotfix's remote branch
git push --set-upstream origin hotfix
# Return to the default branch to create others branches
git checkout main
# Create and go on "bugfix" branch
git checkout -b bugfix
# Track bugfix's local branch and make it associate with bugfix's remote branch
git push --set-upstream origin bugfix
# Return to the default branch to create others branches
git checkout main
# Create and go on "test" branch
git checkout -b test
# Track test's local branch and make it associate with test's remote branch
git push --set-upstream origin test
# Return to the default branch to start working if you want
git checkout develop
# See branches list. We are normally able to see if all branches were correctly created
git branch -l
# Go out from the repo and return where all Oken repositories are placed on your own system
cd ..


#----------------------------
# MAKE THE JOB FOR REPO 04 --
#----------------------------
# Check if user is a the right place in is own system
ls -alt
# Clone the repository
git clone $git_repo04
# Go to the repository cloned
cd $local_repo04
# Check if user is at the right place in is own system
ls -alt
# Make "main" as the default branch in your local system
git branch -M main
# Track main's local branch and make it associate with main's remote branch
git push -uf origin main
# Create and go on "develop" branch
git checkout -b develop
# Track develop's local branch and make it associate with develop's remote branch
git push --set-upstream origin develop
# Create and go on "feature/develop" branch
git checkout -b feature/develop
# Track feature/develop's local branch and make it associate with feature/develop's remote branch
git push --set-upstream origin feature/develop
# Return to the default branch to create others branches
git checkout main
# Create and go on "devops" branch
git checkout -b devops
# Track devops's local branch and make it associate with devops's remote branch
git push --set-upstream origin devops
# Return to the default branch to create others branches
git checkout main
# Create and go on "hotfix" branch
git checkout -b hotfix
# Track hotfix's local branch and make it associate with hotfix's remote branch
git push --set-upstream origin hotfix
# Return to the default branch to create others branches
git checkout main
# Create and go on "bugfix" branch
git checkout -b bugfix
# Track bugfix's local branch and make it associate with bugfix's remote branch
git push --set-upstream origin bugfix
# Return to the default branch to create others branches
git checkout main
# Create and go on "test" branch
git checkout -b test
# Track test's local branch and make it associate with test's remote branch
git push --set-upstream origin test
# Return to the default branch to start working if you want
git checkout develop
# See branches list. We are normally able to see if all branches were correctly created
git branch -l
# Go out from the repo and return where all Oken repositories are placed on your own system
cd ..


#----------------------------
# MAKE THE JOB FOR REPO 05 --
#----------------------------
# Check if user is a the right place in is own system
ls -alt
# Clone the repository
git clone $git_repo05
# Go to the repository cloned
cd $local_repo05
# Check if user is at the right place in is own system
ls -alt
# Make "main" as the default branch in your local system
git branch -M main
# Track main's local branch and make it associate with main's remote branch
git push -uf origin main
# Create and go on "develop" branch
git checkout -b develop
# Track develop's local branch and make it associate with develop's remote branch
git push --set-upstream origin develop
# Create and go on "feature/develop" branch
git checkout -b feature/develop
# Track feature/develop's local branch and make it associate with feature/develop's remote branch
git push --set-upstream origin feature/develop
# Return to the default branch to create others branches
git checkout main
# Create and go on "devops" branch
git checkout -b devops
# Track devops's local branch and make it associate with devops's remote branch
git push --set-upstream origin devops
# Return to the default branch to create others branches
git checkout main
# Create and go on "hotfix" branch
git checkout -b hotfix
# Track hotfix's local branch and make it associate with hotfix's remote branch
git push --set-upstream origin hotfix
# Return to the default branch to create others branches
git checkout main
# Create and go on "bugfix" branch
git checkout -b bugfix
# Track bugfix's local branch and make it associate with bugfix's remote branch
git push --set-upstream origin bugfix
# Return to the default branch to create others branches
git checkout main
# Create and go on "test" branch
git checkout -b test
# Track test's local branch and make it associate with test's remote branch
git push --set-upstream origin test
# Return to the default branch to start working if you want
git checkout develop
# See branches list. We are normally able to see if all branches were correctly created
git branch -l
# Go out from the repo and return where all Oken repositories are placed on your own system
cd ..


#----------------------------
# MAKE THE JOB FOR REPO 06 --
#----------------------------
# Check if user is a the right place in is own system
ls -alt
# Clone the repository
git clone $git_repo06
# Go to the repository cloned
cd $local_repo06
# Check if user is at the right place in is own system
ls -alt
# Make "main" as the default branch in your local system
git branch -M main
# Track main's local branch and make it associate with main's remote branch
git push -uf origin main
# Create and go on "develop" branch
git checkout -b develop
# Track develop's local branch and make it associate with develop's remote branch
git push --set-upstream origin develop
# Create and go on "feature/develop" branch
git checkout -b feature/develop
# Track feature/develop's local branch and make it associate with feature/develop's remote branch
git push --set-upstream origin feature/develop
# Return to the default branch to create others branches
git checkout main
# Create and go on "devops" branch
git checkout -b devops
# Track devops's local branch and make it associate with devops's remote branch
git push --set-upstream origin devops
# Return to the default branch to create others branches
git checkout main
# Create and go on "hotfix" branch
git checkout -b hotfix
# Track hotfix's local branch and make it associate with hotfix's remote branch
git push --set-upstream origin hotfix
# Return to the default branch to create others branches
git checkout main
# Create and go on "bugfix" branch
git checkout -b bugfix
# Track bugfix's local branch and make it associate with bugfix's remote branch
git push --set-upstream origin bugfix
# Return to the default branch to create others branches
git checkout main
# Create and go on "test" branch
git checkout -b test
# Track test's local branch and make it associate with test's remote branch
git push --set-upstream origin test
# Return to the default branch to start working if you want
git checkout develop
# See branches list. We are normally able to see if all branches were correctly created
git branch -l
# Go out from the repo and return where all Oken repositories are placed on your own system
cd ..


#----------------------------
# MAKE THE JOB FOR REPO 07 --
#----------------------------
# Check if user is a the right place in is own system
ls -alt
# Clone the repository
git clone $git_repo07
# Go to the repository cloned
cd $local_repo07
# Check if user is at the right place in is own system
ls -alt
# Make "main" as the default branch in your local system
git branch -M main
# Track main's local branch and make it associate with main's remote branch
git push -uf origin main
# Create and go on "develop" branch
git checkout -b develop
# Track develop's local branch and make it associate with develop's remote branch
git push --set-upstream origin develop
# Create and go on "feature/develop" branch
git checkout -b feature/develop
# Track feature/develop's local branch and make it associate with feature/develop's remote branch
git push --set-upstream origin feature/develop
# Return to the default branch to create others branches
git checkout main
# Create and go on "devops" branch
git checkout -b devops
# Track devops's local branch and make it associate with devops's remote branch
git push --set-upstream origin devops
# Return to the default branch to create others branches
git checkout main
# Create and go on "hotfix" branch
git checkout -b hotfix
# Track hotfix's local branch and make it associate with hotfix's remote branch
git push --set-upstream origin hotfix
# Return to the default branch to create others branches
git checkout main
# Create and go on "bugfix" branch
git checkout -b bugfix
# Track bugfix's local branch and make it associate with bugfix's remote branch
git push --set-upstream origin bugfix
# Return to the default branch to create others branches
git checkout main
# Create and go on "test" branch
git checkout -b test
# Track test's local branch and make it associate with test's remote branch
git push --set-upstream origin test
# Return to the default branch to start working if you want
git checkout develop
# See branches list. We are normally able to see if all branches were correctly created
git branch -l
# Go out from the repo and return where all Oken repositories are placed on your own system
cd ..


#----------------------------
# MAKE THE JOB FOR REPO 08 --
#----------------------------
# Check if user is a the right place in is own system
ls -alt
# Clone the repository
git clone $git_repo08
# Go to the repository cloned
cd $local_repo08
# Check if user is at the right place in is own system
ls -alt
# Make "main" as the default branch in your local system
git branch -M main
# Track main's local branch and make it associate with main's remote branch
git push -uf origin main
# Create and go on "develop" branch
git checkout -b develop
# Track develop's local branch and make it associate with develop's remote branch
git push --set-upstream origin develop
# Create and go on "feature/develop" branch
git checkout -b feature/develop
# Track feature/develop's local branch and make it associate with feature/develop's remote branch
git push --set-upstream origin feature/develop
# Return to the default branch to create others branches
git checkout main
# Create and go on "devops" branch
git checkout -b devops
# Track devops's local branch and make it associate with devops's remote branch
git push --set-upstream origin devops
# Return to the default branch to create others branches
git checkout main
# Create and go on "hotfix" branch
git checkout -b hotfix
# Track hotfix's local branch and make it associate with hotfix's remote branch
git push --set-upstream origin hotfix
# Return to the default branch to create others branches
git checkout main
# Create and go on "bugfix" branch
git checkout -b bugfix
# Track bugfix's local branch and make it associate with bugfix's remote branch
git push --set-upstream origin bugfix
# Return to the default branch to create others branches
git checkout main
# Create and go on "test" branch
git checkout -b test
# Track test's local branch and make it associate with test's remote branch
git push --set-upstream origin test
# Return to the default branch to start working if you want
git checkout develop
# See branches list. We are normally able to see if all branches were correctly created
git branch -l
# Go out from the repo and return where all Oken repositories are placed on your own system
cd ..


#----------------------------
# MAKE THE JOB FOR REPO 09 --
#----------------------------
# Check if user is a the right place in is own system
ls -alt
# Clone the repository
git clone $git_repo09
# Go to the repository cloned
cd $local_repo09
# Check if user is at the right place in is own system
ls -alt
# Make "main" as the default branch in your local system
git branch -M main
# Track main's local branch and make it associate with main's remote branch
git push -uf origin main
# Create and go on "develop" branch
git checkout -b develop
# Track develop's local branch and make it associate with develop's remote branch
git push --set-upstream origin develop
# Create and go on "feature/develop" branch
git checkout -b feature/develop
# Track feature/develop's local branch and make it associate with feature/develop's remote branch
git push --set-upstream origin feature/develop
# Return to the default branch to create others branches
git checkout main
# Create and go on "devops" branch
git checkout -b devops
# Track devops's local branch and make it associate with devops's remote branch
git push --set-upstream origin devops
# Return to the default branch to create others branches
git checkout main
# Create and go on "hotfix" branch
git checkout -b hotfix
# Track hotfix's local branch and make it associate with hotfix's remote branch
git push --set-upstream origin hotfix
# Return to the default branch to create others branches
git checkout main
# Create and go on "bugfix" branch
git checkout -b bugfix
# Track bugfix's local branch and make it associate with bugfix's remote branch
git push --set-upstream origin bugfix
# Return to the default branch to create others branches
git checkout main
# Create and go on "test" branch
git checkout -b test
# Track test's local branch and make it associate with test's remote branch
git push --set-upstream origin test
# Return to the default branch to start working if you want
git checkout develop
# See branches list. We are normally able to see if all branches were correctly created
git branch -l
# Go out from the repo and return where all Oken repositories are placed on your own system
cd ..


#----------------------------
# MAKE THE JOB FOR REPO 10 --
#----------------------------
# Check if user is a the right place in is own system
ls -alt
# Clone the repository
git clone $git_repo10
# Go to the repository cloned
cd $local_repo10
# Check if user is at the right place in is own system
ls -alt
# Make "main" as the default branch in your local system
git branch -M main
# Track main's local branch and make it associate with main's remote branch
git push -uf origin main
# Create and go on "develop" branch
git checkout -b develop
# Track develop's local branch and make it associate with develop's remote branch
git push --set-upstream origin develop
# Create and go on "feature/develop" branch
git checkout -b feature/develop
# Track feature/develop's local branch and make it associate with feature/develop's remote branch
git push --set-upstream origin feature/develop
# Return to the default branch to create others branches
git checkout main
# Create and go on "devops" branch
git checkout -b devops
# Track devops's local branch and make it associate with devops's remote branch
git push --set-upstream origin devops
# Return to the default branch to create others branches
git checkout main
# Create and go on "hotfix" branch
git checkout -b hotfix
# Track hotfix's local branch and make it associate with hotfix's remote branch
git push --set-upstream origin hotfix
# Return to the default branch to create others branches
git checkout main
# Create and go on "bugfix" branch
git checkout -b bugfix
# Track bugfix's local branch and make it associate with bugfix's remote branch
git push --set-upstream origin bugfix
# Return to the default branch to create others branches
git checkout main
# Create and go on "test" branch
git checkout -b test
# Track test's local branch and make it associate with test's remote branch
git push --set-upstream origin test
# Return to the default branch to start working if you want
git checkout develop
# See branches list. We are normally able to see if all branches were correctly created
git branch -l
# Go out from the repo and return where all Oken repositories are placed on your own system
cd ..


#----------------------------
# MAKE THE JOB FOR REPO 11 --
#----------------------------
# Check if user is a the right place in is own system
ls -alt
# Clone the repository
git clone $git_repo11
# Go to the repository cloned
cd $local_repo11
# Check if user is at the right place in is own system
ls -alt
# Make "main" as the default branch in your local system
git branch -M main
# Track main's local branch and make it associate with main's remote branch
git push -uf origin main
# Create and go on "develop" branch
git checkout -b develop
# Track develop's local branch and make it associate with develop's remote branch
git push --set-upstream origin develop
# Create and go on "feature/develop" branch
git checkout -b feature/develop
# Track feature/develop's local branch and make it associate with feature/develop's remote branch
git push --set-upstream origin feature/develop
# Return to the default branch to create others branches
git checkout main
# Create and go on "devops" branch
git checkout -b devops
# Track devops's local branch and make it associate with devops's remote branch
git push --set-upstream origin devops
# Return to the default branch to create others branches
git checkout main
# Create and go on "hotfix" branch
git checkout -b hotfix
# Track hotfix's local branch and make it associate with hotfix's remote branch
git push --set-upstream origin hotfix
# Return to the default branch to create others branches
git checkout main
# Create and go on "bugfix" branch
git checkout -b bugfix
# Track bugfix's local branch and make it associate with bugfix's remote branch
git push --set-upstream origin bugfix
# Return to the default branch to create others branches
git checkout main
# Create and go on "test" branch
git checkout -b test
# Track test's local branch and make it associate with test's remote branch
git push --set-upstream origin test
# Return to the default branch to start working if you want
git checkout develop
# See branches list. We are normally able to see if all branches were correctly created
git branch -l
# Go out from the repo and return where all Oken repositories are placed on your own system
cd ..


#----------------------------
# MAKE THE JOB FOR REPO 12 --
#----------------------------
# Check if user is a the right place in is own system
ls -alt
# Clone the repository
git clone $git_repo12
# Go to the repository cloned
cd $local_repo12
# Check if user is at the right place in is own system
ls -alt
# Make "main" as the default branch in your local system
git branch -M main
# Track main's local branch and make it associate with main's remote branch
git push -uf origin main
# Create and go on "develop" branch
git checkout -b develop
# Track develop's local branch and make it associate with develop's remote branch
git push --set-upstream origin develop
# Create and go on "feature/develop" branch
git checkout -b feature/develop
# Track feature/develop's local branch and make it associate with feature/develop's remote branch
git push --set-upstream origin feature/develop
# Return to the default branch to create others branches
git checkout main
# Create and go on "devops" branch
git checkout -b devops
# Track devops's local branch and make it associate with devops's remote branch
git push --set-upstream origin devops
# Return to the default branch to create others branches
git checkout main
# Create and go on "hotfix" branch
git checkout -b hotfix
# Track hotfix's local branch and make it associate with hotfix's remote branch
git push --set-upstream origin hotfix
# Return to the default branch to create others branches
git checkout main
# Create and go on "bugfix" branch
git checkout -b bugfix
# Track bugfix's local branch and make it associate with bugfix's remote branch
git push --set-upstream origin bugfix
# Return to the default branch to create others branches
git checkout main
# Create and go on "test" branch
git checkout -b test
# Track test's local branch and make it associate with test's remote branch
git push --set-upstream origin test
# Return to the default branch to start working if you want
git checkout develop
# See branches list. We are normally able to see if all branches were correctly created
git branch -l
# Go out from the repo and return where all Oken repositories are placed on your own system
cd ..


echo "--------------------------------------"
echo "------------- END OF JOB -------------"
echo "--------------------------------------"
