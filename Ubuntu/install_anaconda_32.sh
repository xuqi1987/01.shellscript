cd ..
name=Anaconda2-4.3.0-Linux-x86.sh
if [ -f $name ]; then
        echo "already download"
else
wget https://repo.continuum.io/archive/Anaconda2-4.3.0-Linux-x86.sh
fi

chmod a+x  $name

./$name

rm $name
