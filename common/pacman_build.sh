#!/bin/bash

rm -r /tmp/appbuild/$APPNAME
mkdir -p /tmp/appbuild/$APPNAME/pkg /tmp/appbuild/$APPNAME/files
pacman -Sy audacity --dbpath /var/lib/pacman --cachedir /tmp/appbuild/$APPNAME/pkg --config $APPDIR/../common/pacman.conf --noconfirm --downloadonly
ls /tmp/appbuild/$APPNAME/pkg/*.tar* | xargs -i tar xf {} -C /tmp/appbuild/$APPNAME/files
cp -R $APPDIR/AppDir /tmp/appbuild/$APPNAME
mv -v /tmp/appbuild/$APPNAME/files/* /tmp/appbuild/$APPNAME/AppDir
