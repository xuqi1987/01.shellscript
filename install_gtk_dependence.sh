# 安装gcc/g++/gdb/make 等基本编程工具
sudo apt-get install build-essential

#安装 libgtk2.0-dev libglib2.0-dev 等开发相关的库文件
sudo apt-get install gnome-core-devel 

# 用于在编译GTK程序时自动找出头文件及库文件位置　
sudo apt-get install pkg-config

#安装 devhelp GTK文档查看程序
sudo apt-get install devhelp

#安装 gtk/glib 的API参考手册及其它帮助文档
sudo apt-get install libglib2.0-doc libgtk2.0-doc

#安装基于GTK的界面GTK是开发Gnome窗口的c/c++语言图形库 
sudo apt-get install glade libglade2-dev

#安装gtk2.0 或者 将gtk+2.0所需的所有文件统通下载安装完毕
sudo apt-get install libgtk2.0-dev

# 查看1.2.x版本
pkg-config --modversion gtk+

#查看 2.x 版本
pkg-config --modversion gtk+-2.0

#查看pkg-config的版本
pkg-config --version

#查看是否安装了gtk

pkg-config --list-all grep gtk

#编译

echo gcc -o Helloworld Helloworld.c `pkg-config --cflags --libs gtk+-2.0`
