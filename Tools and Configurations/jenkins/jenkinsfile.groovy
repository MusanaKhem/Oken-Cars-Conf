//--------------------------------------------------------------------------
// Jenkinsfile.groovy
//--------------------------------------------------------------------------

node{
    cleanWs()
    agent any
    notify('Started')
    tools{
        maven 'mvn'
    }
    try{

        stage('Checkout'){
        checkout scmGit(branches: [[name: '*/develop']], extensions: [], userRemoteConfigs: [[url: 'http://10.10.10.212:2222/oken-consulting/oken-cars-web/spring.git']])
                sh 'cd spring/'
                sh 'mvn clean install -DskipTests'
        }

        notify('START job')

        stage('SonarQube Analysis'){
            def scannerHome = tool 'SonarScanOkenCars';
            withSonarQubeEnv(){
                sh "${scannerHome}/bin/sonar-scanner"
            }
        }

        stage('Check deployment server's environment'){
            sh "git --version"
            sh "java --version"
            sh "whereis java"
            sh "mvn --version"
            sh "whereis mvn"
            sh "docker --version"
            sh "whereis docker"
            sh "docker-compose --version"
            sh "whereis docker-compose"
            sh "systemctl status docker | grep Loaded"
            sh "systemctl status docker | grep Active"
            sh "docker ps"
            sh "docker ps | grep oken-cars-web"
            sh "docker container rm oken-cars-web-apache"
            sh "docker caontainer rm oken-cars-web-angular"
            sh "docker container rm oken-cars-web-spring"
            sh "docker ps
            sh "docker images"
            sh "docker images | grep oken-cars-web"
            sh "docker images rm oken-cars-web-apache:latest"
            sh "docker images rm oken-cars-web-angular:latest"
            sh "docker images rm oken-cars-web-spring:latest"
            sh "docker images"
            sh "docker volume ls"
            sh "ls -lt"
            sh "sudo rm -r oken-cars-web/"
            sh "ls -lt
        }

        stage('Check Network & internet access'){
            sh "ip -4 a | grep ens18""
            sh "cat /etc/hosts | grep oken-cars.oken.lan"
            sh "nslookup oken-cars.oken.lan"
            sh "dig oken-cars.oken.lan"
            sh "ping 10.10.10.1"
            sh "ping 10.10.10.212"
            sh "ping 8.8.8.8"
        }

        stage('Compile App'){
            sh "ls -lt"
            sh "cd spring/"
            sh "mvn compile"
        }

        stage('Package app and Generate Artefact'){
            sh "ls -lt"
            sh "cd spring/"
            sh "mvn clean install -DskipTests" 
        }

        stage('Install NPM'){
            sh "cd ../angular/"
            sh "ng serve"
        }

        stage('Build Oken Cars APP'){
            sh "docker ps"
            sh "cd ../angular/"
            sh "docker-compose up -d"
        }

        stage('Checking Post Build'){
            sh "docker images | grep oken-cars-web-apache"
            sh "docker images | grep oken-cars-web-angular"
            sh "docker images | grep oken-cars-web-spring"
            sh "docker ps | grep apache"
            sh "docker ps | grep angular"
            sh "docker ps | grep spring"
        }

        stage('App requests'){
            sh "curl -I oken-cars.oken.lan"
            sh "curl -i oken-cars.oken.lan"
        }

        notify('END job successful')

     } catch(err) {
         notify("error caught : '$(err)'")
     }

     finally{
         cleanWs()
     }
}
