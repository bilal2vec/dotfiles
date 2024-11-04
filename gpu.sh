#!/bin/bash

DOCKER_IMAGE=$1
DOCKER_USERNAME=$2
DOCKER_PASSWORD=$3

sudo apt-get update

if ! command -v docker &> /dev/null; then
  sudo apt-get install -y docker.io
fi

sudo apt-get install -y nvidia-container-toolkit
sudo systemctl restart docker

sudo usermod -aG docker \$USER
newgrp docker

echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin

docker pull $DOCKER_IMAGE
