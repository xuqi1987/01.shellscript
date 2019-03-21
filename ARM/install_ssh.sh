./install_arm_base_lib.sh

export Source="$(pwd)/source"
export Compressed="$(pwd)/compressed"
export Install="$(pwd)/install"

cd $Compressed
# skip download

tar zxvf openssh-7.9p1.tar.gz  -C  $Source
tar zxvf openssl-1.1.0h.tar.gz  -C  $Source

cd $Source/openssl*
CC=arm-none-linux-gnueabi-gcc  ./config no-asm -shared --prefix=$Install/
sed -i 's/-m64//g' ./Makefile
make
make install

cd $Source/openssh*
./configure --host=arm-none-linux-gnueabi --with-libs --with-zlib=$Install/ --with-ssl-dir=$Install/  --disable-etc-default-login CC=arm-none-linux-gnueabi-gcc AR=arm-none-linux-gnueabi-ar
make

mkdir -p $Install/usr/local/bin
mkdir -p $Install/usr/local/etc
mkdir -p $Install/usr/libexec
mkdir -p $Install/var/run
mkdir -p $Install/var/empty

cp scp $Install/usr/local/bin/
cp sftp $Install/usr/local/bin/
cp ssh  $Install/usr/local/bin/
cp sshd $Install/usr/local/bin/
cp ssh-add $Install/usr/local/bin/
cp ssh-agent $Install/usr/local/bin/
cp ssh-keygen $Install/usr/local/bin/
cp ssh-keyscan $Install/usr/local/bin/
cp moduli $Install/usr/local/etc/
cp ssh_config $Install/usr/local/etc/
cp sshd_config $Install/usr/local/etc/
cp sftp-server $Install/usr/libexec/
cp ssh-keysign $Install/usr/libexec/

cd $Install
tar -zcf ../gsnap.tar.gz ./bin ./lib ./share





