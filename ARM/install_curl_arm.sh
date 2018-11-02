export Source="$(pwd)/source"
export Compressed="$(pwd)/compressed"
export Install="$(pwd)/install"

if [ ! -d "$Install" ]; then

mkdir -p $Source
mkdir -p $Install
mkdir -p $Compressed


# donwload code
cd $Compressed

wget https://curl.haxx.se/download/curl-7.62.0.tar.gz --no-check-certificate

tar zxvf curl-7.62.0.tar.gz  -C  $Source

cd $Source/curl-7.62.0
CC=arm-none-linux-gnueabi-gcc  ./configure --host=arm-linux --prefix=$Install/
make 
make install

cd $Install
tar -zcf ../curl.tar.gz ./bin ./lib
fi


