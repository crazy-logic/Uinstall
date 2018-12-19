#!/bin/bash

echo lets install unifi. 

# need to do updates first 
sudo apt-get update 

# then some dependancies 
sudo apt-get install oracle-java8-jdk
sudo apt-get install dirmngr

# now lets add ubiquitys package server and update again. 
echo 'deb http://www.ubnt.com/downloads/unifi/debian stable ubiquiti' | sudo tee /etc/apt/sources.list.d/unifi.list
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv C0A52C50
sudo apt-key update 
sudo apt-get update 

# and now lets install 
sudo apt-get install unifi -y 
