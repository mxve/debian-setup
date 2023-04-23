#!/bin/bash

apt-get update
apt-get upgrade -y
apt-get install -y gnupg build-essential sudo htop nload screen nano debian-goodies unzip zip curl wget git fail2ban rsync cifs-utils ufw

ufw allow ssh
ufw enable

curl -fsSL https://raw.githubusercontent.com/mxve/debian-setup/main/.bashrc > /etc/skel/.bashrc
curl -fsSL https://raw.githubusercontent.com/mxve/debian-setup/main/.bashrc > ~/.bashrc

curl -fsSL https://raw.githubusercontent.com/mxve/debian-setup/main/sshd_config > /etc/ssh/sshd_config
curl -fsSL https://raw.githubusercontent.com/mxve/debian-setup/main/issue.net > /etc/issue.net
systemctl restart sshd

echo "Europe/Berlin" > /etc/timezone
unlink /etc/localtime
dpkg-reconfigure -f noninteractive tzdata

ssh-keygen -t rsa -b 4096