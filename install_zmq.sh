cd ..
wget https://github.com/zeromq/zeromq4-1/releases/download/v4.1.5/zeromq-4.1.5.tar.gz
tar -xvf zeromq-4.1.5.tar.gz
cd zeromq-4.1.5
./configure
make -j 4
sudo make install
sudo ldconfig

git clone git://github.com/zeromq/pyzmq.git

pip install cython

cd pyzmq

python setup.py

python setup.py build_ext --inplace

python setup.py test
