#!/bin/bash

Sudo adduser user2
sudo passwd user2
#comment lui a affecté un mdp


# les commandes de la partie Wordpress
##############################################################################################################
# I) Tools of WP
# Installation de docker 
sudo apt-get remove docker docker-engine docker.io containerd runc
#Install using the repository
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg lsb-release
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update
sudo chmod a+r /etc/apt/keyrings/docker.gpg
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
sudo docker run hello-world

#from wordpress on github
git clone https://github.com/kassambara/wordpress-docker-compose
cd wordpress-docker-compose | sudo chown $USER /var/run/docker.sock 
cd wordpress-docker-compose | make autoinstall


##############################################################################################################
sudo apt update
sudo apt install cron
sudo systemctl enable cron
#rc-update add cronie default
echo /5 * * * * user2 /etc/cron.d/backup.sh > /etc/crontab
mkdir /home/user2/data
mkdir /mnt/backup
touch /etc/cron.d/backup.sh
echo #!/bin/bash \cp /home/user2/data /mnt/backup/backup /etc/cron.d/backup.sh > /etc/cron.d/backup.sh
chmod +x /etc/cron.d/backup.sh
/etc/init.d/cron start

