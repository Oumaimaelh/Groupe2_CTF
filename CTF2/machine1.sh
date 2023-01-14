#!/bin/bash

#Creating user
cd
touch scriptPasswd.sh
sudo echo "echo 'debian:tomygrpsecur3' | chpasswd" > scriptPasswd.sh
sudo chmod +x scriptPasswd.sh
sudo ./scriptPasswd.sh

touch scriptPasswdUser1.sh
sudo useradd -m -s /bin/bash knight
sudo echo "echo 'knight:@s3cur3mdp' | chpasswd" > scriptPasswdUser1.sh
sudo chmod +x scriptPasswdUser1.sh
sudo ./scriptPasswdUser1.sh
sudo su -c 'mkdir /home/knight/.ssh' knight
sudo su -c 'touch /home/knight/.ssh/known_hosts' knight
sudo su -c "echo '172.30.150.12 ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBJwpC+ZDI9efM4CE98bzlg1O349YvPjGXP9IRtkpi9JnAyxloN+hdXyljAuP0vCnUauxfbYC1QUlYM4QFLOiP5w=' > /home/knight/.ssh/known_hosts" knight

sudo systemctl enable ssh
sudo apt-get install make -y
sudo apt install git -y
# les commandes de la partie Wordpress
##############################################################################################################
# Installation de docker 
cd /
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
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose -y
sudo docker run hello-world

#from wordpress on github

sudo git clone https://github.com/mouhssineEL/wordpress_docker
sudo cd wordpress_docker
sudo chown $USER /var/run/docker.sock 
#chown $USER /var/run/docker.sock
sudo cd wordpress_docker
make autoinstall

#Onion web Sqli
cd
git clone https://github.com/thanhnguyen287/SQL-Vulnerable.git
cd SQL-Vulnerable
sudo apt-get install python3-pip -y
python3 -m pip install --upgrade pip
python3 -m pip install -r requirements.txt
python3 -m pip install email_validator
sudo cp flask.service /etc/systemd/system/
chmod +x flask.sh
sudo systemctl enable flask.service
sudo systemctl start flask.service

#Webshell login PGP
sudo cp msg /wordpress_docker/wordpress
sudo cp public /wordpress_docker/wordpress
sudo cp private /wordpress_docker/wordpress

#Hint for next machine
sudo su -c "echo 'tomy{good_knight}' > /home/knight/flag4.txt" knight
sudo chmod 600 /home/knight/flag4.txt
sudo su -c "echo 'bishop - 02719440e19a8e087f16d1124defc9ace9e29b29' > /home/knight/login.txt" knight
sudo chmod 600 /home/knight/login.txt
#Remove scripts
cd 
sudo rm scriptPasswdUser1.sh
sudo rm scriptPasswd.sh
sudo rm /home/debian/SQL-Vulnerable/msg
sudo rm /home/debian/SQL-Vulnerable/private
sudo rm /home/debian/SQL-Vulnerable/public
sudo rm /home/debian/SQL-Vulnerable/queenscript.c
sudo rm /home/debian/SQL-Vulnerable/machine1.sh
sudo rm /home/debian/SQL-Vulnerable/mount_pwn
sudo rm /home/debian/SQL-Vulnerable/sneaky.c
sudo rm /home/debian/SQL-Vulnerable/flask.service
sudo rm *machine1.sh*
