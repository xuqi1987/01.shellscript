build=$(pwd)/build
source_path=$(pwd)/sources
mkdir -p $build
mkdir -p $source_path

cd $source_path
wget https://jaist.dl.sourceforge.net/project/libpng/zlib/1.2.11/zlib-1.2.11.tar.gz --no-check-certificate
wget https://jaist.dl.sourceforge.net/project/libpng/libpng16/1.6.35/libpng-1.6.35.tar.gz --no-check-certificate
wget https://fbgrab.monells.se/fbgrab-1.3.tar.gz --no-check-certificate
wget http://www.ijg.org/files/jpegsrc.v9b.tar.gz


tar -xvf ./fbgrab-1.3.tar.gz
tar -xvf ./libpng-1.6.35.tar.gz 
tar -xvf ./zlib-1.2.11.tar.gz 
tar -xvf ./jpegsrc.v9b.tar.gz

cd $source_path/zlib-1.2.11
prefix=$build CC=arm-none-linux-gnueabi-gcc ./configure
make
make install

cd $source_path/libpng-1.6.35
export LDFLAGS="-L$build/lib/"
export CPPFLAGS="-I$build/include/"
 ./configure --prefix=$build/ --build=i686-linux --host=arm-linux CC=arm-none-linux-gnueabi-gcc --with-zlib-prefix=$build/ 
make
make install

cd $source_path/fbgrab-1.3
export LDFLAGS="-L$build/lib/"
export CPPFLAGS="-I$build/include/"

export CFLAGS="-I$build/include/"
export CC=arm-none-linux-gnueabi-gcc
make 


cd $source_path


