sudo apt-get install shadowsocks -y
cd ..
mkdir ~/shadowsocks/
cd ~/shadowsocks/
echo "{" >ss.json
ip=`ifconfig eth1 | grep "inet addr:" | awk '{print $2}' | cut -c 6-`
echo '"server"':'"$ip$"',>>ss.json
echo   '"server_port"':8888, >>ss.json 
echo   '"password"':'"123456"', >>ss.json
echo    '"timeout"':300, >>ss.json 
echo   '"method"':'"aes-256-cfb"', >>ss.json 
echo   '"fast_open"': false >>ss.json
echo "}" >>ss.json 

nohup ssserver -c ~/shadowsocks/ss.json >log&

