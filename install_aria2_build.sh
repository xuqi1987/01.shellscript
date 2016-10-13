cd ..
git clone https://github.com/aria2/aria2.git
sudo apt-get install libgnutls-dev -y
sudo apt-get install nettle-dev -y
sudo apt-get install libgmp-dev -y
sudo apt-get install libssh2-1-dev -y
sudo apt-get install libc-ares-dev -y
sudo apt-get install libxml2-dev -y

sudo apt-get install zlib1g-dev -y
sudo apt-get install libsqlite3-dev -y
sudo apt-get install pkg-config -y

#You can use libgcrypt-dev instead of nettle-dev and libgmp-dev:
#	libgpg-error-dev (Required for BitTorrent, Checksum support)
#	libgcrypt-dev (Required for BitTorrent, Checksum support)

#You can use libssl-dev instead of libgnutls-dev, nettle-dev, libgmp-dev, libgpg-error-dev and libgcrypt-dev:
#	libssl-dev (Required for HTTPS, BitTorrent, Checksum support)

#You can use libexpat1-dev instead of libxml2-dev:
#libexpat1-dev (Required for Metalink support) 

sudo apt-get install libcppunit-dev -y
sudo apt-get install autoconf -y
sudo apt-get install automake -y

sudo apt-get install autotools-dev -y
sudo apt-get install autopoint -y

sudo apt-get install libtool -y

cd aria2

autoreconf -i

./configure

make -j4

sudo make install

aria2c -v | grep 'aria2 version'
