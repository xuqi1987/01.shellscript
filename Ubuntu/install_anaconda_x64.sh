cd ..
if [ -f Anaconda2-4.2.0-Linux-x86_64.sh ]; then
        echo "already download"
else
wget https://repo.continuum.io/archive/Anaconda2-4.2.0-Linux-x86_64.sh
fi

chmod a+x  Anaconda2-4.2.0-Linux-x86_64.sh

./Anaconda2-4.2.0-Linux-x86_64.sh

rm Anaconda2-4.2.0-Linux-x86_64.sh
