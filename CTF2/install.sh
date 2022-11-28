#!/bin/bash

Sudo adduser user2
sudo passwd user2
#comment lui a affecté un mdp


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

