export Source="$(pwd)/source"
export Compressed="$(pwd)/compressed"
export Install="$(pwd)/install"

cd $Compressed
wget https://ohse.de/uwe/releases/lrzsz-0.12.20.tar.gz

tar zxvf lrzsz-0.12.20.tar.gz  -C  $Source
cd $Source/lrzsz-0.12.20/


CC=arm-none-linux-gnueabi-gcc ./configure

cp $Source/lrzsz-0.12.20/src/lrz $Source/lrzsz-0.12.20/src/lsz $Install/usr/sbin

cd $Install

tar -zcf ./lrzs.tar.gz ./usr/sbin/
