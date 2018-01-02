apt-get install libssl-dev

apt-get install uuid-dev 

mkdir mqtt
cd mqtt

wget http://mosquitto.org/files/source/mosquitto-1.4.9.tar.gz
tar -zxvf mosquitto-1.4.9.tar.gz

git clone https://gitee.com/woniu201/libwebsockets.git

cd libwebsockets/

tar -zxvf libwebsockets-v1.5-stable.tar.gz 
cd libwebsockets-v1.5-stable/

mkdir build

cd build/

cmake ..

make install

ldconfig

cd ..
cd ..
tar zxvf mosquitto-1.4.9.tar.gz 
cd mosquitto-1.4.9/
clear
echo "pls modify .mk"
sleep 10
vi config.mk 

make

make install
cp mosquitto.conf /etc/mosquitto

echo "pls modify mosquitto.conf"

adduser mosquitto
 
echo "not finish,pls ref http://www.rainfly.cn/?post=284"
