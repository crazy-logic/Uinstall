!/bin/bash
# wget https://raw.githubusercontent.com/crazy-logic/Uinstall/master/XMR-stakinstall.sh
# sudo chmod +x XMR-stakinstall.sh
# sudo ./XMR-stakinstall.sh

CUDA="0"
donations="0"





#for nvidia - sudo apt install nvidia-cuda-toolkit gcc-6 

echo lets build xmr stak for CPU mining in root/crypto
echo -n "Do you want to enable CUDA for nVidia (y/n)? "
read answer
if [ "$answer" != "${answer#[Yy]}" ] ;then
        CUDA="1"
fi
echo -n "Do you want to remove donations (y/n)? "
read answer
if [ "$answer" != "${answer#[Yy]}" ] ;then
        donations="1"
fi







#end of questioning 

if [ "$CUDA" == "1" ] ; then 
        echo "Installing CUDA"
        sudo apt install nvidia-cuda-toolkit gcc-6 
        sudo ubuntu-drivers autoinstall
fi


sudo apt install libmicrohttpd-dev libssl-dev cmake build-essential libhwloc-dev -y 
sudo apt-get install git -y
cd /
sudo mkdir /crypto
sudo chmod 777 /crypto
cd /crypto
git clone https://github.com/fireice-uk/xmr-stak.git

if [ "$donations" == "1" ] ; then 
        echo "removing donations"
        sed 's/2.0/0.0/g' /crypto/xmr-stak/xmrstak/donate-level.hpp
fi





mkdir /crypto/xmr-stak/build
cd /crypto/xmr-stak/build

if [ "$CUDA" == "1" ];then 
        cmake .. -DOpenCL_ENABLE=OFF -DCUDA_HOST_COMPILER=/usr/bin/gcc-6
else
        cmake .. -DCUDA_ENABLE=OFF -DOpenCL_ENABLE=OFF
fi




make install

#lets install screen 
sudo apt-get install screen -y

sudo sysctl -w vm.nr_hugepages=128
cd /crypto/xmr-stak/build/bin 
sudo ./xmr-stak





