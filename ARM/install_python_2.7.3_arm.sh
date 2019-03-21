export Source="$(pwd)/source"
export Compressed="$(pwd)/compressed"
export Install="$(pwd)/install"

if [ ! -d "$Install" ]; then

mkdir -p $Source
mkdir -p $Install
mkdir -p $Compressed


cd $Source/Python-2.7.3
CC=arm-none-linux-gnueabi-gcc  
CXX=arm-none-linux-gnueabi-g++
AR=arm-none-linux-gnueabi-ar
RANLIB=arm-none-linux-gnueabi-ranlib 
./configure --host=arm-linux --prefix=$Install/

patch -p1 < python-2.7.3-xcompile.patch

make HOSTPYTHON=./hostpython HOSTPGEN=./Parser/hostpgen BLDSHARED="arm-none-linux-gnueabi-gcc -shared" CROSS_COMPILE=arm-none-linux-gnueabi- CROSS_COMPILE_TARGET=yes

make install HOSTPYTHON=./hostpython BLDSHARED="arm-none-linux-gnueabi-gcc -shared" CROSS_COMPILE=arm-none-linux-gnueabi- CROSS_COMPILE_TARGET=yes prefix=$Install/

tar -zcf ../python_2.7.3.tar.gz ./bin ./lib ./share/ ./include/

export PYTHONPATH=$PYTHONPATH:/lib/python2.7
export PYTHONHOME=$PYTHONHOME:/


#编译时遇到过如下错误
#error "This platform's pyconfig.h needs to define PY_FORMAT_LONG_LONG"
#编辑pyconfig.h文件，找到#undef PY_FORMAT_LONG_LONG,添加一行#define PY_FORMAT_LONG_LONG "ll"

fi


