cd ..
mkdir google
cd google
if [ -n "`uname -a | grep x86`" ];then
	wget https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-137.0.1-linux-x86_64.tar.gz
	tar -xvf google-cloud-sdk-137.0.1-linux-x86_64.tar.gz
	rm ./google-cloud-sdk-137.0.1-linux-x86_64.tar.gz
else
	wget https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-137.0.1-linux-x86.tar.gz
	tar -xvf google-cloud-sdk-137.0.1-linux-x86.tar.gz
	rm ./google-cloud-sdk-137.0.1-linux-x86.tar.gz
fi

./google-cloud-sdk/install.sh -Y

gcloud init
