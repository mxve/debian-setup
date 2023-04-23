#!/bin/bash

apt-get update
apt-get upgrade -y
apt-get install -y gnupg build-essential sudo htop nload screen nano debian-goodies unzip zip curl wget git fail2ban rsync cifs-utils ufw

curl -fsSL https://raw.githubusercontent.com/mxve/debian-setup/main/.bashrc > /etc/skel/.bashrc
curl -fsSL https://raw.githubusercontent.com/mxve/debian-setup/main/.bashrc > ~/.bashrc

curl -fsSL https://raw.githubusercontent.com/mxve/debian-setup/main/sshd_config > /etc/ssh/sshd_config
curl -fsSL https://raw.githubusercontent.com/mxve/debian-setup/main/issue.net > /etc/issue.net
systemctl restart sshd

echo "" > /etc/motd

CUR_TIMEZONE=$(cat /etc/timezone)
if [ "$CUR_TIMEZONE" != "Europe/Berlin" ]; then
    echo "Europe/Berlin" > /etc/timezone
    unlink /etc/localtime
    dpkg-reconfigure -f noninteractive tzdata
fi

if [ ! -f ~/.ssh/id_rsa ]; then
    ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa -q -N ""
fi