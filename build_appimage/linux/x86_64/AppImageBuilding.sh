#!/bin/sh

# Creatin AppImage folder
mkdir -p BasicChessEndgames.AppDir/usr/share/applications
mkdir -p BasicChessEndgames.AppDir/usr/bin
mkdir -p BasicChessEndgames.AppDir/usr/share/icons/hicolor/256x256/apps
cp build_appimage/linux/x86_64/BasicChessEndgames.desktop BasicChessEndgames.AppDir
cp frontend/public/icon.png BasicChessEndgames.AppDir/usr/share/icons/hicolor/256x256/apps
cp dist/basic-chess-endgames/basic-chess-endgames-linux_x64 BasicChessEndgames.AppDir/usr/bin
cp dist/basic-chess-endgames/resources.neu BasicChessEndgames.AppDir
cp -R frontend/public BasicChessEndgames.AppDir
chmod +x BasicChessEndgames.AppDir/usr/bin/basic-chess-endgames-linux_x64
chmod 777 BasicChessEndgames.AppDir/BasicChessEndgames.desktop
cd /work/BasicChessEndgamesNeutralino/BasicChessEndgames.AppDir
cp usr/bin/basic-chess-endgames-linux_x64 .
ln -s usr/share/icons/hicolor/256x256/apps/icon.png
cd /work/BasicChessEndgamesNeutralino/
cp build_appimage/linux/x86_64/AppRun BasicChessEndgames.AppDir/AppRun
chmod 777 BasicChessEndgames.AppDir/AppRun
mkdir -p BasicChessEndgames.AppDir/usr/share/glib-2.0
cp -R /usr/share/glib-2.0/schemas BasicChessEndgames.AppDir/usr/share/glib-2.0

# Fetching linuxdeploy
wget https://github.com/linuxdeploy/linuxdeploy/releases/download/continuous/linuxdeploy-x86_64.AppImage
chmod +x ./linuxdeploy-x86_64.AppImage

# First time running linuxdeploy in order to get shared libraries
./linuxdeploy-x86_64.AppImage --appimage-extract
cd /work/BasicChessEndgamesNeutralino/squashfs-root/usr/bin
./linuxdeploy --appdir ../../../BasicChessEndgames.AppDir/ -d ../../../BasicChessEndgames.AppDir/BasicChessEndgames.desktop -i ../../../BasicChessEndgames.AppDir/icon.png -o "appimage"

# Symlink needed libraries
cd /work/BasicChessEndgamesNeutralino/BasicChessEndgames.AppDir
mkdir -p usr/lib/x86_64-linux-gnu/
ln -s usr/lib/libwebkit2gtk-4.0.so.37 usr/lib/x86_64-linux-gnu/libwebkit2gtk-4.0.so.37
mkdir -p usr/lib/x86_64-linux-gnu/gio/modules/
cp /usr/lib/x86_64-linux-gnu/gio/modules/libgvfsdbus.so usr/lib/x86_64-linux-gnu/gio/modules/libgvfsdbus.so
cp /usr/lib/x86_64-linux-gnu/gio/modules/libgiolibproxy.so usr/lib/x86_64-linux-gnu/gio/modules/libgiolibproxy.so
cp /usr/lib/x86_64-linux-gnu/gio/modules/libgiognomeproxy.so usr/lib/x86_64-linux-gnu/gio/modules/libgiognomeproxy.so
cp /usr/lib/x86_64-linux-gnu/gio/modules/libgiognutls.so usr/lib/x86_64-linux-gnu/gio/modules/libgiognutls.so

# Second time running linuxdeploy in order to integrate the symlink
cd /work/BasicChessEndgamesNeutralino/squashfs-root/usr/bin
./linuxdeploy --appdir ../../../BasicChessEndgames.AppDir/ -d ../../../BasicChessEndgames.AppDir/BasicChessEndgames.desktop -i ../../../BasicChessEndgames.AppDir/icon.png -o "appimage"

# Copying the AppImage in the output_dir
cd /work/BasicChessEndgamesNeutralino
mv squashfs-root/usr/bin/*.AppImage /output_dir