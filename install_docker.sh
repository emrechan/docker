#!/bin/bash

echo "Getting updates"
apt update

echo "Installing packages required for Docker"
sudo apt-get install -y \
     apt-transport-https \
     ca-certificates \
     curl \
     gnupg2 \
     software-properties-common

if [ $? -ne 0 ]; then 
  echo "A problem occured when installing reqired packages"
  exit 10
fi

echo "Getting gpg keys!"
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -

if [ $? -ne 0 ]; then 
  echo "A problem occured when getting gpg keys"
  exit 11
fi
sudo apt-key fingerprint 0EBFCD88

echo "Adding Docker repo to sources list!"
echo 'deb https://download.docker.com/linux/debian stretch stable' > \
/etc/apt/sources.list.d/docker.list

echo "Getting updates"
apt update

if [ $? -ne 0 ]; then 
  echo "A problem occured when getting updates!"
  exit 12
fi

echo "Installing Docker"
apt install docker-ce

