#!/bin/bash
# wget https://raw.githubusercontent.com/crazy-logic/Uinstall/master/XMR-stakinstall.sh
# sudo chmod +x XMR-stakinstall.sh
# sudo ./XMR-stakinstall.sh


#for nvidia - sudo apt install nvidia-cuda-toolkit gcc-6 

echo lets build xmr stak for CPU mining in root/crypto
echo -n "Do you want to enable CUDA for nVidia (y/n)? "
read answer
if [ "$answer" != "${answer#[Yy]}" ] ;then
    echo Yes
    echo "installing CUDA"
    sudo apt install nvidia-cuda-toolkit gcc-6
else
    echo No
fi

sudo apt install libmicrohttpd-dev libssl-dev cmake build-essential libhwloc-dev -y 
sudo apt-get install git -y
cd /
sudo mkdir /crypto
sudo chmod 777 /crypto
git clone https://github.com/fireice-uk/xmr-stak.git
sed 's/2.0/0.0/g' /xmr-stak/xmrstak/donate-level.hpp
mkdir xmr-stak/build
cd xmr-stak/build
cmake .. -DCUDA_ENABLE=OFF -DOpenCL_ENABLE=OFF
make install

#lets install screen 
sudo apt-get install screen

sudo sysctl -w vm.nr_hugepages=128
cd xmr-stak/build/bin 
sudo ./xmr-stak

