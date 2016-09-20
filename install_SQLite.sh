wget http://www.sqlite.org/2016/sqlite-autoconf-3140100.tar.gz
tar -xvf sqlite-autoconf-3140100.tar.gz 
cd sqlite-autoconf-3140100
./configure
make -j4
make install
sudo ldconfig
