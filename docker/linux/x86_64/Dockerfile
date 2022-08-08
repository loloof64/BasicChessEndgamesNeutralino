FROM ubuntu:18.04
ENV VERSION=0.1.0

# Base dependencies
RUN apt update
RUN apt install git curl wget -y
RUN apt install libwebkit2gtk-4.0-37 libgpgme-dev desktop-file-utils zsync appstream -y
RUN apt install gvfs-libs glib-networking libgnutls30 -y
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash -
RUN apt install nodejs -y
RUN npm i -g yarn
RUN yarn global add @neutralinojs/neu

# Project and dependencies
RUN mkdir work
WORKDIR /work
RUN git clone https://github.com/loloof64/BasicChessEndgamesNeutralino.git
WORKDIR /work/BasicChessEndgamesNeutralino
RUN yarn
RUN neu update

# Building project
WORKDIR /work/BasicChessEndgamesNeutralino/frontend
RUN yarn
RUN yarn build
WORKDIR /work/BasicChessEndgamesNeutralino
RUN yarn build:neu

# Building AppDir
RUN mkdir -p BasicChessEndgames.AppDir/usr/share/applications
RUN mkdir -p BasicChessEndgames.AppDir/usr/bin
RUN mkdir -p BasicChessEndgames.AppDir/usr/share/icons/hicolor/256x256/apps
RUN cp BasicChessEndgames.desktop BasicChessEndgames.AppDir
RUN cp frontend/public/icon.png BasicChessEndgames.AppDir/usr/share/icons/hicolor/256x256/apps
RUN cp dist/basic-chess-endgames/basic-chess-endgames-linux_x64 BasicChessEndgames.AppDir/usr/bin
RUN cp dist/basic-chess-endgames/resources.neu BasicChessEndgames.AppDir
RUN cp -R frontend/public BasicChessEndgames.AppDir
RUN chmod +x BasicChessEndgames.AppDir/usr/bin/basic-chess-endgames-linux_x64
RUN chmod 777 BasicChessEndgames.AppDir/BasicChessEndgames.desktop
WORKDIR /work/BasicChessEndgamesNeutralino/BasicChessEndgames.AppDir
RUN cp usr/bin/basic-chess-endgames-linux_x64 .
RUN ln -s usr/share/icons/hicolor/256x256/apps/icon.png
WORKDIR /work/BasicChessEndgamesNeutralino/
RUN cp AppRun BasicChessEndgames.AppDir/AppRun
RUN chmod 777 BasicChessEndgames.AppDir/AppRun
RUN mkdir -p BasicChessEndgames.AppDir/usr/share/glib-2.0
RUN cp -R /usr/share/glib-2.0/schemas BasicChessEndgames.AppDir/usr/share/glib-2.0

# Fetching linuxdeploy
RUN wget https://github.com/linuxdeploy/linuxdeploy/releases/download/continuous/linuxdeploy-x86_64.AppImage
RUN chmod +x linuxdeploy-x86_64.AppImage

# First time running linuxdeploy in order to get shared libraries
RUN ./linuxdeploy-x86_64.AppImage --appimage-extract
WORKDIR /work/BasicChessEndgamesNeutralino/squashfs-root/usr/bin
RUN ./linuxdeploy --appdir ../../../BasicChessEndgames.AppDir/ -d ../../../BasicChessEndgames.AppDir/BasicChessEndgames.desktop -i ../../../BasicChessEndgames.AppDir/icon.png -o "appimage"

# Symlink needed libraries
WORKDIR /work/BasicChessEndgamesNeutralino/BasicChessEndgames.AppDir
RUN mkdir -p usr/lib/x86_64-linux-gnu/
RUN ln -s usr/lib/libwebkit2gtk-4.0.so.37 usr/lib/x86_64-linux-gnu/libwebkit2gtk-4.0.so.37
RUN mkdir -p usr/lib/x86_64-linux-gnu/gio/modules/
RUN cp /usr/lib/x86_64-linux-gnu/gio/modules/libgvfsdbus.so usr/lib/x86_64-linux-gnu/gio/modules/libgvfsdbus.so
RUN cp /usr/lib/x86_64-linux-gnu/gio/modules/libgiolibproxy.so usr/lib/x86_64-linux-gnu/gio/modules/libgiolibproxy.so
RUN cp /usr/lib/x86_64-linux-gnu/gio/modules/libgiognomeproxy.so usr/lib/x86_64-linux-gnu/gio/modules/libgiognomeproxy.so
RUN cp /usr/lib/x86_64-linux-gnu/gio/modules/libgiognutls.so usr/lib/x86_64-linux-gnu/gio/modules/libgiognutls.so

# Second time running linuxdeploy in order to integrate the symlink
WORKDIR /work/BasicChessEndgamesNeutralino/squashfs-root/usr/bin
RUN ./linuxdeploy --appdir ../../../BasicChessEndgames.AppDir/ -d ../../../BasicChessEndgames.AppDir/BasicChessEndgames.desktop -i ../../../BasicChessEndgames.AppDir/icon.png -o "appimage"

# Copying the AppImage in the root of project folder
WORKDIR /work/BasicChessEndgamesNeutralino
RUN mv squashfs-root/usr/bin/*.AppImage . 