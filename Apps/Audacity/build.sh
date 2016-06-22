#!/bin/bash

mkdir tmp

wget https://github.com/audacity/audacity/archive/Audacity-2.1.2.tar.gz -O tmp/audacity.tar.xz

wget https://sourceforge.net/projects/wxwindows/files/3.0.2/wxWidgets-3.0.2.tar.bz2 -O tmp/wxWidgets.tar.bz2

cd tmp

tar xf audacity.tar.xz

tar xf wxWidgets.tar.bz2

cd wxWidgets-*

./configure

make install

cd ..

export APPDIR="$(dirname "$(readlink -f "$0")")"
export LD_LIBRARY_PATH="$APPDIR/usr/lib:$PATH"

cd audacity-*

./configure --enable-static-wx=yes
