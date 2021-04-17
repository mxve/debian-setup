#!/bin/bash

echo -e "\n\n\n\nUpdating & installing basic tools\n\n\n\n"
sleep 3
apt-get update
apt-get upgrade -y
apt-get install -y build-essential htop nload screen nano debian-goodies unzip zip curl wget git fail2ban rsync python3 python3-pip python3-setuptools

echo -e "\n\n\n\nInstalling rust\n\n\n\n"
sleep 3
curl https://sh.rustup.rs -sSf | sh -s -- --quiet -y
source $HOME/.cargo/env

echo -e "\n\n\n\nInstalling docker\n\n\n\n"
sleep 3
apt-get remove -y docker docker-engine docker.io containerd runc docker-compose
apt-get install -y apt-transport-https ca-certificates gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
apt-get update
apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose

echo -e "\n\n\n\nInstalling rust-mdr\n\n\n\n"
sleep 3
mkdir -pv /opt/bin
cd /opt/bin
curl -LJO https://github.com/mxve/rust-mdr/releases/download/v0.1.0-release/rust-mdr
chmod +x rust-mdr
ln -s /opt/bin/rust-mdr /usr/bin/mdr

echo -e "\n\n\n\nSetting up doc.md\n\n\n\n"
sleep 3
curl -fsSL https://raw.githubusercontent.com/mxve/debian-setup/main/bin/doc > /usr/local/bin/doc
chmod +x /usr/local/bin/doc
touch /root/doc.md

echo -e "\n\n\n\nSetting timezone Europe/Berlin\n\n\n\n"
sleep 3
echo "Europe/Berlin" > /etc/timezone
unlink /etc/localtime
dpkg-reconfigure -f noninteractive tzdata

echo -e "\n\n\n\nCreating /etc/profile.d/mxve_bash.sh\n\n\n\n"
sleep 3
curl -fsSL https://raw.githubusercontent.com/mxve/debian-setup/main/profile.d/mxve_bash.sh > /etc/profile.d/mxve_bash.sh
chmod +x /etc/profile.d/mxve_bash.sh

echo -e "\n\n\n\nReplacing sshd_config\n\n\n\n"
sleep 10
# bippity boppity ssh key mandatory
curl -fsSL https://raw.githubusercontent.com/mxve/debian-setup/main/ssh/sshd_config > /etc/ssh/sshd_config
systemctl restart sshd

echo -e "\n\n\n\nDone, check ssh functionality before closing session\n\n\n\n"
