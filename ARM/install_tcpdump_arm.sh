export Source="$(pwd)/source"
export Compressed="$(pwd)/compressed"
export Install="$(pwd)/install"

if [ ! -d "$Install" ]; then

mkdir -p $Source
mkdir -p $Install
mkdir -p $Compressed

# donwload code
cd $Compressed

wget http://www.tcpdump.org/release/tcpdump-4.9.2.tar.gz
wget http://www.tcpdump.org/release/libpcap-1.9.0.tar.gz

tar zxvf tcpdump-4.9.2.tar.gz  -C  $Source
tar zxvf libpcap-1.9.0.tar.gz  -C  $Source

cd $Source/libpcap-1.9.0
CC=arm-none-linux-gnueabi-gcc  ./configure --host=arm-linux --with-pcap=linux --prefix=$Install/
make 
make install

cd $Source/tcpdump-4.9.2

CC=arm-none-linux-gnueabi-gcc ./configure --host=arm-linux --with-pcap=linux --prefix=$Install/
make 
make install

cd $Install
tar -zcf ../tcpdump.tar.gz ./bin ./lib ./sbin

fi


