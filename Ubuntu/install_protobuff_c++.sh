mkdir protobuf
cd protobuf
git clone https://github.com/google/protobuf.git
sudo apt-get install autoconf automake libtool curl make g++ unzip

cd protobuf
./autogen.sh
./configure
make
make check
sudo make install
sudo ldconfig

