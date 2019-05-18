./clear.sh
export Source="$(pwd)/source"
export Compressed="$(pwd)/compressed"
export Install="$(pwd)/install"

if [ ! -d "$Install" ]; then

mkdir -p $Source
mkdir -p $Install
mkdir -p $Compressed

# donwload code
cd $Compressed



wget https://jaist.dl.sourceforge.net/project/libpng/zlib/1.2.11/zlib-1.2.11.tar.gz --no-check-certificate
wget https://jaist.dl.sourceforge.net/project/libpng/libpng16/1.6.35/libpng-1.6.35.tar.gz --no-check-certificate
wget https://fbgrab.monells.se/fbgrab-1.3.tar.gz --no-check-certificate
wget http://www.ijg.org/files/jpegsrc.v9b.tar.gz

# decompression tar
tar zxvf zlib-1.2.11.tar.gz  -C  $Source
tar zxvf libpng-1.6.35.tar.gz  -C  $Source
tar zxvf fbgrab-1.3.tar.gz  -C  $Source
tar zxvf jpegsrc.v9b.tar.gz  -C  $Source


# zlib
cd $Source/zlib-1.2.11
prefix=$Install CC=arm-none-linux-gnueabi-gcc ./configure
make
make install

# libpng
cd $Source/libpng-1.6.35

export LDFLAGS="-L$Install/lib/"
export CPPFLAGS="-I$Install/include/"
 ./configure --prefix=$Install/ --build=i686-linux --host=arm-linux CC=arm-none-linux-gnueabi-gcc --with-zlib-prefix=$Install/ 
make
make install


# jpeg-9b
cd $Source/jpeg-9b
./configure --prefix=$Install/ --build=i686-linux --host=arm-linux CC=arm-none-linux-gnueabi-gcc
make
make install

cd $Install

tar -zcf ./base.tar.gz ./bin/ ./lib/ ./share/
fi
