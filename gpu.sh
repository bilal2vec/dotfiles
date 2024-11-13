#!/bin/bash

sudo apt-get update

if ! command -v docker &> /dev/null; then
  sudo apt-get install -y docker.io
fi

sudo apt-get install -y nvidia-container-toolkit
sudo systemctl restart docker

sudo usermod -aG docker $USER

sudo docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD
sudo docker pull $DOCKER_IMAGE

newgrp docker

