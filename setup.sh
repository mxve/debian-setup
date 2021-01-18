echo -e "\n\n\n\nUpdating & installing basic tools\n\n\n\n"
sleep 5
apt-get update
apt-get upgrade -y
apt-get install -y build-essential htop nload screen nano debian-goodies unzip zip curl wget git fail2ban rsync

# docker
echo -e "\n\n\n\nInstalling docker\n\n\n\n"
sleep 5
apt-get remove -y docker docker-engine docker.io containerd runc
apt-get install -y apt-transport-https ca-certificates gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
apt-get update
apt-get install -y docker-ce docker-ce-cli containerd.io


echo -e "\n\n\n\nSetting timezone Europe/Berlin\n\n\n\n"
sleep 5
echo "Europe/Berlin" > /etc/timezone
unlink /etc/localtime
dpkg-reconfigure -f noninteractive tzdata

echo -e "\n\n\n\nReplacing sshd_config\n\n\n\n"
sleep 10
# bippity boppity ssh key mandatory
curl -fsSL https://raw.githubusercontent.com/mxve/debian-setup/main/sshd_config > /etc/ssh/sshd_config
systemctl restart sshd
