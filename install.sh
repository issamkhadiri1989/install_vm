#!/bin/sh

echo "### Preparation ###"
apt upgrade -y
echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/docker.gpg] https://download.docker.com/linux/ubuntu jammy stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
apt update -y

# install CURL 
apt install -y curl

echo "###### Install Docker... ######"
apt-get update  && apt-get install -y ca-certificates curl gnupg lsb-release
# Add Docker’s official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Set up the Docker repository
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install Docker Engine
apt-get update
apt-get install -y docker-ce docker-ce-cli containerd.io

# Start and enable Docker
systemctl start docker && systemctl enable docker

# Make sure that Docker is installed
docker --version
docker run hello-world # this container will just show a "Hello World!" to make sure that Docker is correctly installed and enabled

# Add the User to Docker group
usermod -aG docker $USER

echo "###### Install Docker Compose ... ######"
curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

echo "##### Install dependencies... ######"
# Make
apt-get update && \
  apt-get install -y make && \
  apt-get install -y build-essential && \
  make --version 

# Git
add-apt-repository ppa:git-core/ppa && \
  apt-get update && \
apt-get install -y git && \
  git --version

## ---- Install VS CODE --- ##
echo "##### Install VS Code ... ######"
snap install --classic code

