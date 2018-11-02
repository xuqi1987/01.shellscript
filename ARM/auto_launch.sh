ifconfig eth1 136.17.77.21
thttpd -D -C /etc/thttpd.conf &

while true
do
	gsnap /home/httpd/html/1.png /dev/fb0
	sleep 5
done

