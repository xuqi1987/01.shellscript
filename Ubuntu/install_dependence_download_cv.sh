#Install dependencies
sudo apt-get update
sudo apt-get upgrade -y

#We then need to install some developer tools, including CMake, which helps us configure the OpenCV build process
sudo apt-get install build-essential cmake pkg-config -y

#we need to install some image I/O packages that allow us to load various image file formats from disk. Examples of such file formats include JPEG, PNG, TIFF, etc.:
sudo apt-get install libjpeg-dev libtiff5-dev libjasper-dev libpng12-dev -y

#Just as we need image I/O packages, we also need video I/O packages. These libraries allow us to read various video file formats from disk as well as work directly with video streams:

sudo apt-get install libavcodec-dev libavformat-dev libswscale-dev libv4l-dev -y
sudo apt-get install libxvidcore-dev libx264-dev -y

#The OpenCV library comes with a sub-module named highgui  which is used to display images to our screen and build basic GUIs. In order to compile the highgui  module, we need to install the GTK development library:
sudo apt-get install libgtk2.0-dev -y

#Many operations inside of OpenCV (namely matrix operations) can be optimized further by installing a few extra dependencies:
sudo apt-get install libatlas-base-dev gfortran -y

# let’s install both the Python 2.7 and Python 3 header files so we can compile OpenCV with Python bindings:
sudo apt-get install python2.7-dev python3-dev -y

#Step #3: Download the OpenCV source code
#Now that we have our dependencies installed, let’s grab the 3.1.0  archive of OpenCV from the official OpenCV repository. (Note: As future versions of openCV are released, you can replace 3.1.0  with the latest version number):

cd ~
wget -O opencv.zip https://github.com/Itseez/opencv/archive/3.1.0.zip
unzip opencv.zip

#We’ll want the full install of OpenCV 3 (to have access to features such as SIFT and SURF, for instance), so we also need to grab the opencv_contrib repository as well
wget -O opencv_contrib.zip https://github.com/Itseez/opencv_contrib/archive/3.1.0.zip
unzip opencv_contrib.zip

#Python 2.7 or Python 3
wget https://bootstrap.pypa.io/get-pip.py
sudo python get-pip.py

sudo pip install virtualenv virtualenvwrapper
sudo rm -rf ~/.cache/pip

# virtualenv and virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

echo -e "\n# virtualenv and virtualenvwrapper" >> ~/.profile
echo "export WORKON_HOME=$HOME/.virtualenvs" >> ~/.profile
echo "source /usr/local/bin/virtualenvwrapper.sh" >> ~/.profile

source ~/.profile

mkvirtualenv cv -p python2

workon cv

pip install numpy

cd ~/opencv-3.1.0/
mkdir build
cd build

cmake -D CMAKE_BUILD_TYPE=RELEASE \
    -D CMAKE_INSTALL_PREFIX=/usr/local \
    -D INSTALL_PYTHON_EXAMPLES=ON \
    -D BUILD_opencv_python2=ON \
    -D PYTHON2_LIBRARIES=/usr/lib/arm-linux-gnueabihf/libpython2.7.so \
    -D PYTHON2_NUMPY_INCLUDE_DIRS=~/.virtualenvs/cv/local/lib/python2.7/site-packages/numpy/core/include \
    -D OPENCV_EXTRA_MODULES_PATH=~/opencv_contrib-3.1.0/modules \
    -D BUILD_EXAMPLES=ON ..

make -j4

sudo make install

sudo ldconfig

ls -l /usr/local/lib/python2.7/site-packages/

cd ~/.virtualenvs/cv/lib/python2.7/site-packages/

ln -s /usr/local/lib/python2.7/site-packages/cv2.so cv2.so
