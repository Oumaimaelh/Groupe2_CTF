#!/bin/bash
#Change hostname
#sudo hostnamectl set-hostname "easypeasy"
#sudo echo "127.0.1.1 easypeasy.novalocal easypeasy" | sudo tee -a /etc/hosts

touch scriptPasswd.sh
sudo echo "echo 'debian:123' | chpasswd" > scriptPasswd.sh
sudo chmod +x scriptPasswd.sh
sudo ./scriptPasswd.sh
sudo apt-get update
sudo apt-get install apache2 -y
sudo /etc/init.d/apache2 start
#OpenRC est un remplaçant du démon init system permet à la configuration ses services et l’activation des services au démarrage
sudo apt-get install openrc -y
sudo rc-update add apache2 default
sudo apt-get install git -y
sudo apt-get install npm -y
sudo apt-get update
sudo apt-get install nodejs -y
sudo apt update
sudo git clone --branch master https://github.com/Oumaimaelh/command_line.git
cd /command_line/
sudo npm install 
sudo apt-get install gnupg -y
sudo wget -qO - https://www.mongodb.org/static/pgp/server-4.4.asc | sudo apt-key add -
echo "deb http://repo.mongodb.org/apt/debian buster/mongodb-org/4.4 main" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.4.list
sudo apt-get update
sudo apt-get install mongodb-org -y
echo "mongodb-org hold" | sudo dpkg --set-selections
echo "mongodb-org-server hold" | sudo dpkg --set-selections
echo "mongodb-org-shell hold" | sudo dpkg --set-selections
echo "mongodb-org-mongos hold" | sudo dpkg --set-selections
echo "mongodb-org-tools hold" | sudo dpkg --set-selections
sudo systemctl daemon-reload
sudo systemctl start mongod
sudo systemctl enable mongod
sudo a2enmod proxy proxy_http rewrite headers expires
sudo touch /etc/apache2/sites-available/tomygrpCmd.com.conf
sudo echo -e "<VirtualHost *:80> \n\tServerName tomygrpCmd.com \n\tServerAlias www.tomygrpCmd.com \n\tProxyRequests Off \n\tProxyPreserveHost On \n\tProxyVia Full \n\t<Proxy *> \n\t\tRequire all granted \n\t</Proxy> \n\tProxyPass / http://127.0.0.1:3000/ \n\tProxyPassReverse / http://127.0.0.1:30000/ \n</VirtualHost>" > /etc/apache2/sites-available/tomygrpCmd.com.conf
sudo a2dissite 000-default
sudo a2ensite tomygrpCmd.com.conf
sudo systemctl restart apache2
sudo npm install pm2 -g
sudo pm2 start ./app.js --name tomygrpCmd.com
sudo pm2 save
sudo pm2 startup
sudo npm install -g newman
newman run Projet_Securite.postman_collection.json
#si on a une erreur faut juste modifier le fichier de mongodb



