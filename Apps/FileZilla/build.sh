#!/bin/bash

mkdir tmp
 
wget https://sourceforge.net/projects/wxwindows/files/3.0.2/wxWidgets-3.0.2.tar.bz2 -O tmp/wxWidgets.tar.bz2
 
cd tmp
 
tar xf wxWidgets.tar.bz2

cd wxWidgets-*
 
./configure
 
make install
 
cd ..

wget https://sourceforge.net/projects/filezilla/files/libfilezilla/0.5.3/libfilezilla-0.5.3.tar.bz2/download -O ./libfilezilla.tar.bz2

tar xf libfilezilla.tar.bz2

cd libfilezilla-*

./configure --prefix=/mnt/appimager/build

make install

cd ..

svn co https://svn.filezilla-project.org/svn/FileZilla3/trunk filezilla

cd filezilla

autoreconf -i #generate a configuration per system settings
./configure --prefix=/mnt/appimager/build
make
make install
