#!/bin/bash

# Use gcc 5
update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-5 60 --slave /usr/bin/g++ g++ /usr/bin/g++-5

# Make tmp directory
mkdir work
cd work

# wxWidgets
wget https://sourceforge.net/projects/wxwindows/files/3.0.2/wxWidgets-3.0.2.tar.bz2 -O wxWidgets.tar.bz2
tar xf wxWidgets.tar.bz2
cd wxWidgets-*
./configure --prefix=/mnt/appimager/build --enable-unicode --without-libtiff --without-libjpeg --with-expat=builtin --with-libpng=builtin
make install
cd ..

# libfilezilla
wget https://sourceforge.net/projects/filezilla/files/libfilezilla/0.5.3/libfilezilla-0.5.3.tar.bz2/download -O ./libfilezilla.tar.bz2
tar xf libfilezilla.tar.bz2
cd libfilezilla-*
./configure --prefix=/mnt/appimager/build
make install
cd ..

# libidn
wget http://ftp.gnu.org/gnu/libidn/libidn-1.32.tar.gz
tar xf libidn-1.32.tar.gz
cd libidn-1.32
./configure --prefix=/mnt/appimager/build
make install
cd ..

# Nettle
wget http://ftp.gnu.org/gnu/nettle/nettle-3.1.1.tar.gz
tar xf nettle-3.1.1.tar.gz
cd nettle-3.1.1
./configure --prefix=/mnt/appimager/build --enable-fat CFLAGS="-I/mnt/appimager/build/include" LDFLAGS="-I/mnt/appimager/build/lib"
make install
cd ..

# gnutls
wget ftp://ftp.gnutls.org/gcrypt/gnutls/v3.4/gnutls-3.4.4.1.tar.xz
tar xf gnutls-3.4.4.1.tar.xz
cd gnutls-3.4.4.1
./configure --prefix=/mnt/appimager/build --with-included-libtasn1 --without-p11-kit --disable-doc --enable-local-libopts
make install
cd ..

# SQLite
wget http://sqlite.org/2016/sqlite-autoconf-3100200.tar.gz
tar xvzf sqlite-autoconf-3100200.tar.gz
cd sqlite-autoconf-3100200
./configure --prefix=/mnt/appimager/build
make install
cd ..

# Filezilla
svn co https://svn.filezilla-project.org/svn/FileZilla3/trunk filezilla
cd filezilla
autoreconf -i
./configure --prefix=/mnt/appimager/build --with-pugixml=builtin --without-dbus
make install
