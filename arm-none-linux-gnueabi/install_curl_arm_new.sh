export Source="$(pwd)/source"
export Compressed="$(pwd)/compressed"
export Install="$(pwd)/install"


mkdir -p $Install

cd $Source/openssl*
CC=arm-none-linux-gnueabi-gcc  ./config no-asm -shared --prefix=$Install/
sed -i 's/-m64//g' ./Makefile
make
make install

cd $Source/curl-7.20.0
CC=arm-none-linux-gnueabi-gcc  ./configure --host=arm-linux --prefix=$Install/ --with-ssl=$Install/
make 
make install

cd $Install
tar -zcf ../curl_720_102q.tar.gz ./bin ./lib



