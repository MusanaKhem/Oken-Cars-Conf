#!/bin/bash
set -e
#CREATE TEMPLATE
#ENVIRONMENT VARIABLES
args:
 # General Virtual Machine settings options for template
 $vmid=201
 $3=""
 $vm_agent=1
 $balloon=1024
 $cores=9
 $vm_ide2="iso/ubuntu-20.04.6-live-server-amd64.iso,media=cdrom"
 $memory=2048
 $vm_name="DockerCompose01"
 $net0="virtio,bridge=vmbr1,tag=500,firewall=1,mtu=1500"
 $vm_nodename="node-pve2"
 $numa=0
 $ostype=126
 $scsihw="virtio-scsi-single"
 $sockets=1
 $virtio0_disk_size=11
 $virtio0_format="vmdk"
 $virtio0_iothread="on"
 $storage="local"
 # Usefull information
 $net_bridge="vmbr1"
 $net_tag=500
 $net_mtu=1500
 $os_storage= "local"
 $os_iso_image="ubuntu-20.04.6-live-server-amd64.iso"
 $resize_disk_size=15
 $guest_os_type="Linux"
 $guest_os_version="6.x - 2.6 Kernel"
 # User VM' credentials
 $username="okenprod"
 $userpassword="oken221$oken222!!"
 $JAVA=17
 $UBUNTU=20.04.6
 $MAVEN=3.9.3
 # VM Gitlab's credentials
 $gitlab_oken_lan_username="DockerCompose01"
 $gitlab_oken_lan_userpassword="oken221$oken222"
 $jenkins_oken_lan_username="DockerCompose01"
 $jenkins_oken_lan_userpassword="oken221$oken222"

#START CREATE VM TEMPLATE TO RECEIVE OKCW WEB APPLICATION
#File name in the current directory
function create_template() {
    #Print all of the configuration
    echo "Creating template $2 ($1)"

    #Create new VM
    #Select the node where the VM is set
	nodename ${vm_nodename}

    #Feel free to change any of these to your liking
    qm create ${vmid} --name ${vm_name} --ostype ${ostype}

    #Set networking to default bridge
    qm set ${vmid} --net0 virtio,bridge=${net_bridge},tag=${net_tag},firewall=1,mtu=${net_mtu}

    #Set display to serial
    qm set ${vmid} --serial0 socket --vga serial0

    #Set memory, cpu, type defaults
    #If you are in a cluster, you might need to change cpu type
    qm set ${vmid} --memory ${memory} --cores ${cores} --cpu host

    #Set disks
    qm set ${vmid} --virtio0 ${os_storage}:${virtio0_disk_size},format=${virtio0_format},iothread=${virtio0_iothread}

    #Set boot device to new file
    qm set ${vmid} --virtio-block ${os_storage}:0,import-from="$(pwd)/$3",discard=on
    #Set scsi hardware as default boot disk using virtio scsi single
    qm set ${vmid} --boot order=scsi0 --scsihw ${scsihw}
    
    #Enable Qemu guest agent in case the guest has it available
    qm set ${vmid} --agent enabled=${vm_agent} ${vm_agent},fstrim_cloned_disks=1
    
    #Add cloud-init device
    qm set ${vmid} --ide2 ${vm_ide2}:local
    
    #Set CI ip config
    #IP6 = auto means SLAAC (a reliable default with no bad effects on non-IPv6 networks)
    #IP = DHCP means what it says, so leave that out entirely on non-IPv4 networks to avoid DHCP delays
    qm set ${vmid} --ipconfig0 "ip6=auto,ip=dhcp"
    
    #Import the ssh keyfile
    qm set ${vmid} --sshkeys ${ssh_keyfile}
    
    #If you want to do password-based auth instaed
    #Then use this option and comment out the line above
    #qm set $1 --cipassword password
    #Add the user
    qm set ${vmid} --ciuser ${username}
    
    #Resize the disk to 8G, a reasonable minimum. You can expand it more later.
    #If the disk is already bigger than 8G, this will fail, and that is okay.
    #If necessary to update resize_disk_size then set $resize_disk_size at the top of the page. cf. ENVIRONMENT VARIABLES !
    qm disk resize ${vmid} scsi0 ${resize_disk_size}G
    
    #Make it a template
    qm template ${vmid}

    #Remove file when done
    rm $3
    #Go to home directory
    cd home/
    echo "####################################################################################"
    echo "########### Ubuntu server 20.04.6 is correctly installed and operational. ##########"
    echo "####################################################################################"
}
#INSTALL VIM
function install vim() {
    #Install Vim 
    sudo apt install vim
    #Go to home directory
    cd home/
    echo "##################################################################"
    echo "########### Vim is correctly installed and operational. ##########"
    echo "##################################################################"	
}
#INSTALL NANO
function install nano() {
    #Install Nano 
    sudo apt install nano
    #Go to home directory
    cd home/
    echo "###################################################################"
    echo "########### Nano is correctly installed and operational. ##########"
    echo "###################################################################"
}
#PREPARE SSH
function prepare ssh() {
    sudo apt update
    sudo apt upgrade
    #Generate ssh public key 
    ssh-keygen
    #Path to your ssh authorized_keys file
    #Alternatively, use /etc/pve/priv/authorized_keys if you are already authorized
    #On the Proxmox system
    export ssh_keyfile=/root/id_rsa.pub
    #Go to home directory
    cd home/
    echo "##################################################################"
    echo "########### SSH is correctly installed and operational. ##########"
    echo "##################################################################"	
}
#SIMPLY SETS FOR VM TEMPLATE
#Username to create on VM template
export username=okenprod
#Name of your storage
export storage=local

#STEP TO START TOOLS INSTALLATION
#PREPARE ENVIRONMENT TO INSTALL DOCKER AND OTHER TOOLS
function prepare_env_install_docker() {
    sudo apt-get update && sudo apt-get dist-upgrade
    #Install curl and net-tools
    sudo apt-get install curl net-tools
    #Remove docker.pid to be sure that Docker default PID is free
    sudo rm -rf /var/snap/docker/179/run/docker.pid
    #Remove docker ; docker-engine ; docker.io containerd to be sure VM do not have those tools installed
    sudo apt remove docker docker-engine docker.io containerd runc
    #Go to home directory
    cd home/
    echo "###########################################################"
    echo "########### Environment ready to install Docker. ##########"
    echo "###########################################################"
}
#INSTALL DOCKER
function install docker() {
    sudo apt update
    sudo apt upgrade
    #Download Docker from official website
    curl -fsSL https://get.docker.com -o get-docker.sh
    #Run Docker installation program
    sudo sh get-docker.sh
    #Enable docker service
    sudo systemctl enable docker.service
    #Enable containerd service
    sudo systemctl enable containerd.service
    #Configure docker username
    sudo usermod -aG docker $username
    #
    newgrp docker
    #Run docker-hello-world to show that installed's docker can communicate with deamon
    docker run hello-world
    #Edit docker service
    sudo systemctl edit docker.service
    #Change ExecStart line in docker service file edition
    sed	[Service]
        deb	ExecStart=
        fin	ExecStart=/usr/bin/dockerd -H fd:// -H tcp://0.0.0.0:2375
    #Reload daemon
    sudo systemctl daemon-reload
    #Restart docker service
    sudo systemctl restart docker.service
    #Run docker service in the background
	sudo dockerd &
    #
    sudo truncate -s 0 /etc/machine-id
    #
    sudo -e /etc/systemd/system/regenerate_ssh_host_keys.service
    #Enable ssh service to regenerate ssh host keys
    sudo systemctl enable regenerate_ssh_host_keys.service
    #Go to home directory
    cd home/
    echo "############################################################################"
    echo "##### Docker et Docker-compose is correctly installed and operational. #####"
    echo "############################################################################"
}
#INSTALL GIT
function install git() {
    sudo apt update
    sudo apt upgrade
    #Download Git
    sudo dnf install git-all
    #Installa Git
    sudo apt install git-all -y
    #Verify Git version
    git --version
    #Install asciidoc ; xmltp ; docbook2x git's tools
    sudo apt-get install asciidoc xmlto docbook2x -y
    #Install info git's tools
    sudo apt-get install install-info
    #Unzip Git's Zip download folder
    tar -zxf git-2.8.0.tar.gz
    #Direction to the git folder
    cd git-2.8.0
    #Configure Git
    make configure
    ./configure --prefix=/usr
    make all doc info
    #Install Doc, Html and Info raeding tools via Git
    sudo make install install-doc install-html install-info
    #Clone Git official repository
    git clone https://git.kernel.org/pub/scm/git/git.git
    #Go to home directory
    cd home/
    echo "##################################################################"
    echo "########### Git is correctly installed and operational. ##########"
    echo "##################################################################"
    #Check Git version
    git --version
    #Go to home directory
    cd home/
    #Create a directory named apps
    mkdir apps
    #Go to the directory named apps
    cd apps/
    #Initialize Git in apps directory to receive th
    git init
}
#INSTALL JAVA JDK
function install java_jdk() {
    sudo apt update
    sudo apt upgrade
    sudo apt-get install default-jdk -y
    echo "skip python installation"
    sudo apt-get install openjdk-17-jdk -y
    #Go to home directory
    cd home/
    echo "#################################################################"
    echo "######### Java is correctly installed and operational. ##########"
    echo "#################################################################"
}
#INSTALL MAVEN
function install maven() {
    sudo apt update
    sudo apt upgrade
    # Install MAVEN
	sudo apt install maven
   93  wget https://dlcdn.apache.org/maven/maven-3/3.9.4/binaries/apache-maven-3.9.4-bin.tar.gz
   94  ls
   97  tar -xvzf apache-maven-3.9.4-bin.tar.gz
   98  ls
   99  mv apache-maven-3.9.4 maven
  100  ls
  101  cd maven/
  102  cd bin/
  103  ./mvn -v
	
    #Go to home directory
    cd home/
    echo "##################################################################"
    echo "######### Maven is correctly installed and operational. ##########"
    echo "##################################################################"
}
#VERIFY IF ALL NECESSARY TOOLS VERSION
function verif_tools() {
    #Download kernel updates
    sudo apt update
    #Install kernel updates
    sudo apt upgrade
    #Check Vim version
    vim --version
    #Check Nano version
    nano --version
    #Check Git Version
    git --version
    #Check Docker version
    docker --version
    #Check Docker Compose version
	docker-compose --version
    #Check Docker Containerd version
	containerd --version
    #Check Java version
    java --version
    #Check Maven version
    mvn --version
    #Go to home directory
    cd home/
    echo "#######################################################################"
    echo "######### All tools are correctly installed and operational. ##########"
    echo "#######################################################################"
}
#SHOW SOME SUMMARY INFORMATION
funtion vminfo() {
    #Check VM's hostname
    echo "hostname"
    #Check VM's IP address(es) with IPv4 protocol
    echo "ip -4 a"
    #echo ""
    #Go to home directory
    cd home/
    echo "#########################################################################################"
    echo "######### Here you can check VM hostname and see other summarized information. ##########"
    echo "#########################################################################################"
}
#FINAL MESSAGE TO TELL USER THAT VIRTUAL MACHINE IS READY TO BE USED
echo "###########################################################################"
echo "######### VM is correctly installed, configured and operational. ##########"
echo "###########################################################################"

