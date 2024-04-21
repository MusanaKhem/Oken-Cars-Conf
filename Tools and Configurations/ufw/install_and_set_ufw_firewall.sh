echo "Pass in admin mode"
sudo sudo su
echo $dockercompose_pass
echo "Authorize "
sudo ufw disable
echo "y"
echo "Open the port for Apache"
sudo ufw allow 80/tcp or ufw allow proto tcp to any port 80
echo "Open the port for Angular"
sudo ufw allow 4200/tcp or ufw allow proto tcp to any port 4200
echo "Open the port for Spring"
sudo ufw allow 8081/tcp or ufw allow proto tcp to any port 8081
echo "Open the port for Database"
sudo ufw allow 5432/tcp or ufw allow proto tcp to any port 5432
echo ""
sudo ufw enable && echo y
echo "Verify Ubuntu Server 22.04 firewall' rules"
sudo ufw status numbered
