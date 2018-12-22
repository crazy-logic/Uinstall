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
