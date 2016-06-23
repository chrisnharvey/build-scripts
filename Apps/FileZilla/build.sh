#!/bin/bash

update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-5 60 --slave /usr/bin/g++ g++ /usr/bin/g++-5

mkdir tmp

wget https://sourceforge.net/projects/wxwindows/files/3.0.2/wxWidgets-3.0.2.tar.bz2 -O tmp/wxWidgets.tar.bz2

cd tmp

tar xf wxWidgets.tar.bz2

cd wxWidgets-*

./configure --prefix=/mnt/appimager/build --enable-unicode --without-libtiff --without-libjpeg --with-expat=builtin --with-libpng=builtin

make install

cd ..

wget https://sourceforge.net/projects/filezilla/files/libfilezilla/0.5.3/libfilezilla-0.5.3.tar.bz2/download -O ./libfilezilla.tar.bz2

tar xf libfilezilla.tar.bz2

cd libfilezilla-*

./configure --prefix=/mnt/appimager/build

make install

cd ..

curl -O https://gmplib.org/download/gmp/gmp-6.0.0a.tar.xz
tar xf gmp-6.0.0a.tar.xz
cd gmp-6.0.0
./configure --prefix=/mnt/appimager/build --enable-fat
cd ..

wget http://ftp.gnu.org/gnu/nettle/nettle-3.1.1.tar.gz
tar xf nettle-3.1.1.tar.gz
cd nettle-3.1.1
./configure --prefix=/mnt/appimager/build --enable-fat --with-gmp
make install
cd ..

wget http://zlib.net/zlib-1.2.8.tar.gz
tar xf zlib-1.2.8.tar.gz
cd zlib-1.2.8
./configure --prefix=/mnt/appimager/build
make install
cd ..

wget ftp://ftp.gnutls.org/gcrypt/gnutls/v3.4/gnutls-3.4.4.1.tar.xz
tar xf gnutls-3.4.4.1.tar.xz
cd gnutls-3.4.4.1
./configure --prefix=/mnt/appimager/build -with-included-libtasn1 --disable-doc --disable-guile --without-p11-kit --enable-local-libopts --disable-nls
make install
cd ..

wget https://sqlite.org/2015/sqlite-autoconf-3081101.tar.gz
tar xf sqlite-autoconf-3081101.tar.gz
cd sqlite-autoconf-3081101
./configure --prefix=/mnt/appimager/build
make install
cd ..

#
svn co https://svn.filezilla-project.org/svn/FileZilla3/trunk filezilla

cd filezilla

autoreconf -i #generate a configuration per system settings
./configure --prefix=/mnt/appimager/build
# make
# make install
