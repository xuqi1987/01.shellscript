sudo apt-get update 
wget https://nginx.org/keys/nginx_signing.key
sudo apt-key add nginx_signing.key
rm nginx_signing.key
sudo apt-get install nginx -y

cd ..
if [ ! -d  03.ubuntu_Server ]; then
	git clone  git@github.com:xuqi1987/03.ubuntu_Server.git
fi;
cd 03.ubuntu_Server/nginx/
ln -s /etc/nginx/sites-enabled/default ./
ln -s /var/www/html ./
nginx -s reload

