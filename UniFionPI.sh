#!/bin/bash

echo lets install unifi. 

// need to do updates first 
sudo apt-get update 

// then some dependancies 
sudo apt-get install oracle-java8-jdk
sudo apt-get install dirmngr

// now lets add ubiquity's package server and update again. 
echo 'deb http://www.ubnt.com/downloads/unifi/debian stable ubiquiti' | sudo te$
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv C0A52C50
sudo apt-key update 

// and now lets install 
sudo apt-get install unifi -y 
