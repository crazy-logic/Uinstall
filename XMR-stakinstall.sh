#!/bin/bash
# wget https://raw.githubusercontent.com/crazy-logic/Uinstall/master/XMR-stakinstall.sh
# sudo chmod XMR-stakinstall.sh
# sudo /.XMR-stakinstall.sh

echo lets build xmr stak for CPU mining 

sudo apt install libmicrohttpd-dev libssl-dev cmake build-essential libhwloc-dev -y 
sudo apt-get install git -y
git clone https://github.com/fireice-uk/xmr-stak.git
mkdir xmr-stak/build
cd xmr-stak/build
cmake .. -DCUDA_ENABLE=OFF -DOpenCL_ENABLE=OFF
make install

#lets install screen 
sudo apt-get install screen

sudo sysctl -w vm.nr_hugepages=128
cd xmr-stak/build/bin 
sudo ./xmr-stak

