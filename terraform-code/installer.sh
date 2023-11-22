#!/bin/bash
sudo apt-get update -y
sudo apt-get install -y apache2 git
sudo apt install -y php libapache2-mod-php 

sudo systemctl enable apache2
sudo systemctl start apache2