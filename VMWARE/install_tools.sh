#!/bin/bash


##############################
# Install repository and tools
##############################
yum -y update
yum install -y epel-release

# Non-interactive SSH login
yum install -y sshpass

# Other tools
yum install -y python3
yum install -y wget
yum install -y git
yum install -y tree
yum install -y net-tools
yum install -y bind-utils
yum install -y bash-completion

# install docker & docker-compose
sudo yum install -y git
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
sudo usermod -aG docker vagrant
sudo systemctl enable docker
sudo systemctl start docker
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose 


# Change keyboard to fr
localectl set-keymap fr
echo "loadkeys fr" >> ~vagrant/.bashrc


# Install zsh autocompletion
cd /etc/yum.repos.d/
wget https://download.opensuse.org/repositories/shells:zsh-users:zsh-completions/CentOS_7/shells:zsh-users:zsh-completions.repo
yum install zsh-completions

echo "For this Stack, you will use $(ip -f inet addr show eth1 | sed -En -e 's/.*inet ([0-9.]+).*/\1/p') IP Address, port 22, private key is located in local_dir/.vagrant/machines/centos/vmware_deskto/private_key"