export Source="$(pwd)/source"
export Compressed="$(pwd)/compressed"
export Install="$(pwd)/install"

if [ ! -d "$Install" ]; then

mkdir -p $Source
mkdir -p $Install
mkdir -p $Compressed


cd $Source/openssl*
CC=arm-none-linux-gnueabi-gcc  ./config no-asm -shared --prefix=$Install/
sed -i 's/-m64//g' ./Makefile
make
make install


# donwload code
cd $Compressed

wget https://curl.haxx.se/download/curl-7.62.0.tar.gz --no-check-certificate

tar zxvf curl-7.62.0.tar.gz  -C  $Source

cd $Source/curl-7.62.0
CC=arm-none-linux-gnueabi-gcc  ./configure --host=arm-linux --prefix=$Install/ --with-ssl=$Install/
make 
make install

cd $Install
tar -zcf ../curl_720_102q.tar.gz ./bin ./lib
fi


