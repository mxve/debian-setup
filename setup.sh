#!/bin/bash

echo "Updating & installing basic tools"
sleep 3
apt-get update
apt-get upgrade -y
apt-get install -y gnupg build-essential goaccess sudo htop nload screen nano debian-goodies unzip zip curl wget git fail2ban rsync python3 python3-pip python3-setuptools cifs-utils logwatch

echo "Installing docker"
sleep 3
apt-get remove -y docker docker-engine docker.io containerd runc docker-compose
apt-get install -y apt-transport-https ca-certificates gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
 apt-get update
 apt-get install docker-ce docker-ce-cli containerd.io

echo "Setting timezone Europe/Berlin"
sleep 3
echo "Europe/Berlin" > /etc/timezone
unlink /etc/localtime
dpkg-reconfigure -f noninteractive tzdata

echo "Creating /etc/profile.d/mxve_bash.sh"
sleep 3
curl -fsSL https://raw.githubusercontent.com/mxve/debian-setup/main/profile.d/mxve_bash.sh > /etc/profile.d/mxve_bash.sh
chmod +x /etc/profile.d/mxve_bash.sh

echo "Replacing sshd_config"
sleep 10
# bippity boppity ssh key mandatory
curl -fsSL https://raw.githubusercontent.com/mxve/debian-setup/main/ssh/sshd_config > /etc/ssh/sshd_config
systemctl restart sshd

echo "Settings up firewall"
apt install ufw -y
ufw allow ssh
ufw enable

echo -e "\n\n\n\nDone, check ssh functionality before closing session"
