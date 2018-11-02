export Source="$(pwd)/source"
export Compressed="$(pwd)/compressed"
export Install="$(pwd)/install"

if [ ! -d "$Install" ]; then

mkdir -p $Source
mkdir -p $Install
mkdir -p $Compressed

# donwload code
cd $Compressed
wget http://www.acme.com/software/thttpd/thttpd-2.29.tar.gz

# decompression tar
tar zxvf thttpd-2.29.tar.gz  -C  $Source

cd $Source/thttpd-2.29
./configure

sed -i 's/CC =.*/CC = arm-none-linux-gnueabi-gcc/g' ./Makefile
make

mkdir -p $Install/usr/sbin
mkdir -p $Install/etc/

cp thttpd $Install/usr/sbin/
cp ./contrib/redhat-rpm/thttpd.conf $Install/etc/
sed -i 's/user=.*/user=root/g' $Install/etc/thttpd.conf

mkdir -p $Install/home/httpd 
mkdir -p $Install/home/httpd/html
chmod 755 $Install/home/httpd
chmod 755 $Install/home/httpd/html
cd $Install/home/httpd/html
echo "hello" > index.html
chmod 644 index.html

cd $Install
tar -zcf ../thttpd.tar.gz ./home ./usr ./etc

fi
