#!/bin/bash

#Change hostname
#sudo hostnamectl set-hostname "chessboard"
#sudo echo "127.0.1.1 chessboard.novalocal chessboard" | sudo tee -a /etc/hosts

#Creating user
cd
touch scriptPasswd.sh
sudo echo "echo 'debian:tomygrpsecur3' | chpasswd" > scriptPasswd.sh
sudo chmod +x scriptPasswd.sh
sudo ./scriptPasswd.sh

touch scriptPasswdUser1.sh
sudo useradd -m -s /bin/bash bishop
sudo echo "echo 'bishop:hijohn' | chpasswd" > scriptPasswdUser1.sh
sudo chmod +x scriptPasswdUser1.sh
sudo ./scriptPasswdUser1.sh

touch scriptPasswdUser2.sh
sudo useradd -m -s /bin/bash rook
sudo echo "echo 'rook:scarycronnie' | chpasswd" > scriptPasswdUser2.sh
sudo chmod +x scriptPasswdUser2.sh
sudo ./scriptPasswdUser2.sh

touch scriptPasswdUser3.sh
sudo useradd -m -s /bin/bash -u 1009 queen
sudo echo "echo 'queen:tomygroup' | chpasswd" > scriptPasswdUser3.sh
sudo chmod +x scriptPasswdUser3.sh
sudo ./scriptPasswdUser3.sh

touch scriptPasswdUser4.sh
sudo useradd -m -s /bin/bash pawn
sudo echo "echo 'pawn:timetopromote' | chpasswd" > scriptPasswdUser4.sh
sudo chmod +x scriptPasswdUser4.sh
sudo ./scriptPasswdUser4.sh

touch scriptPasswdUser5.sh
sudo useradd -m -s /bin/bash king
sudo echo "echo 'pawn:snakeoil' | chpasswd" > scriptPasswdUser5.sh
sudo chmod +x scriptPasswdUser5.sh
sudo ./scriptPasswdUser5.sh

sudo systemctl enable ssh

#########################CRONTAB VULN######################################

sudo apt update
sudo apt install cron -y
sudo systemctl enable cron
sudo chmod o+w

sudo echo "*/5 * * * * rook /home/rook/backup.sh" | sudo tee -a /etc/crontab
sudo su -c 'mkdir /home/rook/data' rook
sudo su -c 'touch /home/rook/data/test_backup' rook
sudo su -c 'mkdir /home/rook/backup' rook
sudo su -c 'touch /home/rook/backup.sh' rook
sudo su -c  "echo 'tomy{Cr0n_i5_g0n3}' > /home/rook/data/flag5.txt" rook
sudo chmod 600 /home/rook/data/flag5.txt
sudo su -c  "echo -e '#!/bin/bash \ncp -r /home/rook/data /home/rook/backup' > /home/rook/backup.sh" rook
sudo chmod 777 /home/rook/backup.sh
sudo /etc/init.d/cron start

########################PATH VARIABLE VULN#######################################
cd /home/queen
sudo apt install gcc -y
sudo su -c 'wget https://raw.githubusercontent.com/thanhnguyen287/SQL-Vulnerable/main/queenscript.c' queen
sudo su -c 'gcc -o reveal queenscript.c' queen
sudo su -c 'chmod u+s reveal' queen
sudo su -c "echo -e 'Is this the real life?\nIs this just fantasy?' > /home/queen/msg" queen
sudo chmod 666 /home/queen/msg
sudo su -c  "echo 'tomy{Path_Variable_6}' > /home/queen/flag6.txt" queen
sudo chmod 600 /home/queen/flag6.txt
sudo su -c  "echo 'Login for the last stage: pawn - timetopromote' > /home/queen/next" queen
sudo chmod 600 /home/queen/next

sudo rm queenscript.c*

########################SNAKE OIL CRYPTOGRAPHY#################################
sudo apt-get install gnupg -y
sudo su -c  "echo 'tomy{Snake_Oil_Crypto}' > /home/king/flag7.txt" king
#weaeeaete c !s alyks silloectpse udyhh 2d  ters0octa ac2nrhlpsy3
sudo su -c  "echo scytale2023 | gpg -c --batch --yes --passphrase-fd 0 /home/king/flag7.txt" king
sudo rm /home/king/flag7.txt

########################BUFFER OVERFLOW#######################################
cd /home/pawn

sudo apt-get install gcc-multilib -y
sudo wget https://raw.githubusercontent.com/thanhnguyen287/SQL-Vulnerable/main/sneaky.c
sudo echo "0" | sudo tee /proc/sys/kernel/randomize_va_space
sudo gcc -z execstack -fno-stack-protector -m32 -no-pie -o mount_pwn sneaky.c
sudo chmod u+s mount_pwn
sudo echo "tomy{pawn_r00t_fl4g}" | sudo tee /root/flag_root.txt
sudo rm sneaky.c*
sudo su -c 'chmod 750 /home/pawn' pawn


##########################Clean up ###########################################
cd
sudo rm scriptPasswd*
sudo rm *machine2.sh*


