./install_arm_base_lib.sh

export Source="$(pwd)/source/"
export Compressed="$(pwd)/compressed/"
export Install="$(pwd)/install/"

cd $Source
if [ ! -d "gsnap" ]; then
git clone https://github.com/luhuadong/gsnap.git

cd $Source/gsnap
arm-none-linux-gnueabi-gcc gsnap.c   -I$Install/include/ -L$Install/lib/ -lz -lpng -ljpeg -o gsnap

fi

cp -rf gsnap $Install/bin/

cd $Install
tar -zcf $Install/../gsnap.tar.gz $Install/bin/ $Install/lib/ $Install/share/





