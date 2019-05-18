export Source="$(pwd)/source"
export Compressed="$(pwd)/compressed"
export Install="$(pwd)/install"

if [ ! -d "$Install" ]; then

mkdir -p $Source
mkdir -p $Install
mkdir -p $Compressed


# donwload code
cd $Source/openssl-1.0.2q/
./Configure --prefix=$Install/ --cross-compile-prefix=arm-linux-gnueabihf- no-asm shared linux-armv4 -march=armv7-a -D__ARM_MAX_ARCH__=7
make
make install

env LDFLAGS=-R/usr/local/src/arm-linux/openssl/lib ./configure --prefix=$Install/ --prefix=$Install/   CC=arm-linux-gnueabihf-gcc --host=arm-linux --with-ssl=$Install/

make 
make install




