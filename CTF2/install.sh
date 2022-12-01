#!/bin/bash

touch scriptPasswd.sh
sudo echo "echo 'debian:123' | chpasswd" > scriptPasswd.sh
sudo chmod +x scriptPasswd.sh
sudo ./scriptPasswd.sh

touch scriptPasswdUser2.sh
sudo adduser user2
sudo echo "echo 'user2:123' | chpasswd" > scriptPasswdUser2.sh
sudo chmod +x scriptPasswdUser2.sh
sudo ./scriptPasswdUser2.sh


sudo systemctl enable ssh

# les commandes de la partie Wordpress
##############################################################################################################
# I) Tools of WP
# Installation de docker 
sudo apt-get remove docker docker-engine docker.io containerd runc 
#Install using the repository
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg lsb-release -y
sudo mkdir -p /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update
sudo chmod a+r /etc/apt/keyrings/docker.gpg
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y
sudo docker run hello-world

#from wordpress on github
sudo git clone https://github.com/kassambara/wordpress-docker-compose
sudo cd wordpress-docker-compose | sudo chown $USER /var/run/docker.sock 
sudo cd wordpress-docker-compose | make autoinstall


##############################################################################################################
sudo apt update
sudo apt install cron -y
sudo systemctl enable cron
#rc-update add cronie default
sudo echo "/5 * * * * user2 /etc/cron.d/backup.sh" > /etc/crontab
sudo mkdir /home/user2/data
sudo mkdir /mnt/backup
sudo touch /etc/cron.d/backup.sh
sudo echo -e "#!/bin/bash \ncp /home/user2/data /mnt/backup/backup /etc/cron.d/backup.sh" > /etc/cron.d/backup.sh
sudo chmod +x /etc/cron.d/backup.sh
sudo /etc/init.d/cron start

