#!bin/bash

# Update & Install dependencies
echo -e "\033[0;32mUpdating and Installing dependencies...\033[0m"
sudo apt update && sudo apt upgrade -y
sudo apt install -y ca-certificates apt-transport-https zlib1g-dev software-properties-common libncurses5-dev libgdbm-dev libnss3-dev curl git wget make jq build-essential pkg-config lsb-release libssl-dev libreadline-dev libffi-dev gcc screen unzip lz4 expect
clear 

# Install Docker
echo -e "\033[0;32mAdd repository and Installing Docker...\033[0m"
apt-get update
apt-get install ca-certificates curl
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
chmod a+r /etc/apt/keyrings/docker.asc
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get update
apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose docker-compose-plugin -y 
clear

# Install Python
echo -e "\033[0;32mInstall Python3 and Pip3...\033[0m"
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt update
sudo apt install -y python3.12 python3.12-venv python3.10-venv
# install pip
sudo curl -sS https://bootstrap.pypa.io/get-pip.py | python3.12
clear

# Install Nodejs
echo -e "\033[0;32mInstall Nodejs via nvm-list...\033[0m"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
nvm list-remote
echo -e "\033[0;32mSelect your Node.js version: \033[0m" 
read NODEJS_USER
nvm install $NODEJS_USER

if [ $? -eq 0 ]; then
    clear
    echo -e "\033[0;32mNode.js version $NODEJS_USER installed successfully!\033[0m"
else
    echo -e "\033[0;31mFailed to install Node.js version $NODEJS_USER. Please check the logs above.\033[0m"
fi

# Install PHP
echo -e "\033[0;32mInstall php and php extension...\033[0m"
sudo apt update -y && sudo apt upgrade -y
sudo add-apt-repository ppa:ondrej/php
sudo apt-get update -y
sudo apt-get install php8.3 php8.3-mysql php8.3-imap php8.3-ldap php8.3-xml php8.3-curl php8.3-mbstring php8.3-zip -y
clear

# Install mariadb
echo -e "\033[0;32mInstall MariaDB Database...\033[0m"
sudo apt update -y && sudo apt upgrade -y
sudo apt install mariadb-server -y
