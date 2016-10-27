cd ..

git clone https://github.com/zeromq/libzmq
./autogen.sh && ./configure && make -j 4
make check && make install && sudo ldconfig


git clone git://github.com/zeromq/pyzmq.git

pip install cython

cd pyzmq

python setup.py

python setup.py build_ext --inplace

python setup.py test
