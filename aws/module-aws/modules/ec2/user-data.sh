#!/bin/bash

# Update system packages
sudo apt-get update -y

# Install developer dependancies
sudo apt-get install build-essential -y



# Update system packages

sudo apt-get install nginx -y
sudo systemctl start nginx.service
sudo systemctl enable nginx.service

# Create project directory
sudo mkdir /var/sites
sudo chown -R ubuntu:ubuntu /var/sites



echo "softwares installed successfully.."