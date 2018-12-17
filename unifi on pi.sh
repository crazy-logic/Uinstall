#!/bin/bash

echo lets install unifi. 

sudo apt-get update 
sudo apt-get install oracle-java8-jdk

sudo apt-get install dirmngr

echo 'deb http://www.ubnt.com/downloads/unifi/debian stable ubiquiti' | sudo te$
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv C0A52C50
sudo apt-key update 

sudo apt-get update 
sudo apt-get install unifi -y 
