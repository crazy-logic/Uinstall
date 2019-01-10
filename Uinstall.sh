#!/bin/bash

# Matts installer... 

sudo apt-get-update 

sudo apt-get install net-tools git openssh-server simplescreenrecorder vlc 




sudo apt-get install build-essential cmake pkg-config libboost-all-dev libssl-dev libunbound-dev \
libminiupnpc-dev libunwind8-dev liblzma-dev libldns-dev libexpat1-dev





sudo add-apt-repository ppa:graphics-drivers/ppa

sudo apt update

sudo ubuntu-drivers autoinstall

sudo apt install nvidia-cuda-toolkit gcc-6


#lets install apache with php  and some bits for codiad 
sudo apt-get install php 
sudo apt-get install php-zip php-mbstring
sudo service apache2 restart

#lets remove index.html and clone in codiad 
cd /var/www/html 
rm index.html 
sudo git clone https://github.com/crazy-logic/Codiad /var/www/html/
sudo touch /var/www/html/config.php
sudo chown www-data:www-data -R /var/www/html/
