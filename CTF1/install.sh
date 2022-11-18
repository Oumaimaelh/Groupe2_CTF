#!/bin/bash

apt update
apt install apache2
/etc/init.d/apache2 start
#OpenRC est un remplaçant du démon init system permet à la configuration ses services et l’activation des services au démarrage
apt-get install openrc 
rc-update add apache2 default
apt-get install git 
Apt-get install npm
sudo apt update
sudo apt install nodejs
sudo apt update
sudo git clone --branch master ************************************************.git 
sudo cd command_line
npm install 




sudo a2enmod proxy proxy_http rewrite headers expires
sudo touch /etc/apache2/sites-available/tomygrpCmd.com.conf
sudo echo <VirtualHost *:80> \ServerName example.com \ServerAlias www.example.com \ProxyRequests Off \ProxyPreserveHost On \ProxyVia Full \<Proxy *> \Require all granted \</Proxy> \ProxyPass / http://127.0.0.1:3000/ \ProxyPassReverse / http://127.0.0.1:30000/ \</VirtualHost> >> /etc/apache2/sites-available/example.com.conf
sudo a2dissite 000-default
sudo a2ensite example.com.conf
sudo systemctl restart apache2
sudo npm install pm2 -g
sudo pm2 start ./app.js --name tomygrpCmd.com
sudo pm2 save
sudo pm2 startup
