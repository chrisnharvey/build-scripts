#!/bin/bash

mkdir tmp

wget https://sourceforge.net/projects/wxwindows/files/3.0.2/wxWidgets-3.0.2.tar.bz2 -O tmp/wxWidgets.tar.bz2

cd tmp

tar xf wxWidgets.tar.bz2

cd wxWidgets-*

./configure

make install

cd ..

svn co https://svn.filezilla-project.org/svn/FileZilla3/trunk filezilla #get filezilla source
autoreconf -i #generate a configuration per system settings
./configure #configure the filezilla distro
make #make filezilla
make install #install filezilla
