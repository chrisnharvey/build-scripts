#!/bin/bash -x

# In this case, the upstream project seems to already
# provide binaries that are supposed to run everywhere,
# so we merely package these as an AppImage

set +e

URL="https://atom.io/download/deb?channel=beta"
echo $URL

APP=Atom

mkdir build
cd build

mkdir -p usr/bin

wget --no-check-certificate -c --trust-server-names "$URL"

dpkg -x ./atom*deb* .

wget --no-check-certificate -c "https://github.com/probonopd/AppImageKit/releases/download/5/AppRun" # (64-bit)
chmod a+x ./AppRun

# Move icon into place so that AppImageAssistant finds them
cp ./usr/share/pixmaps/atom.png .

# TODO: Get appdata
# mkdir -p ./usr/share/appdata/
# wget --no-check-certificate -q "..." -O ./usr/share/appdata/atom.appdata.xml

# Get desktop file
cp ./usr/share/applications/atom-beta.desktop .
sed -i -e "s|/usr/share/atom-beta/||g" atom-beta.desktop

# Remove launcher and move in place
# TODO: Replace this by something cleaner
rm usr/bin/atom
mv usr/share/atom/* usr/bin/

# Add desktop integration
XAPP=atom-beta
wget --no-check-certificate -O ./usr/bin/$XAPP.wrapper https://raw.githubusercontent.com/probonopd/AppImageKit/master/desktopintegration
chmod a+x ./usr/bin/$XAPP.wrapper
sed -i -e "s|Exec=$XAPP|Exec=$XAPP.wrapper|g" $XAPP.desktop

# Figure out $VERSION
VERSION=$(grep -r "atom@" ./usr/share/doc/atom/copyright | cut -d " " -f 2 | cut -d "@" -f 2)
echo $VERSION
