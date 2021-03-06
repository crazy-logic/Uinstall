#!/bin/bash

echo lets build Loki

sudo apt install libmicrohttpd-dev libssl-dev cmake build-essential libhwloc-dev -y 
sudo apt-get install git -y
sudo apt-get install build-essential cmake pkg-config libboost-all-dev libssl-dev libzmq3-dev	libpgm-dev libunbound-dev libsodium-dev -y

cd /
mkdir crypto/loki 
cd /crypro/loki
git clone --recursive https://github.com/loki-project/loki
mkdir /build
make 

# maybe try 'make -j1 CC=gcc-6 CPP=g++-6 CXX=g++-6 LD=g++-6' if issues with GCC 7 
