FROM ubuntu:18.04

# base setup
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get install -y --no-install-recommends apt-utils
RUN apt-get install -y --no-install-recommends libgtk-3-dev wget git curl
RUN apt-get install -y --no-install-recommends gvfs-libs glib-networking libgnutls30
RUN apt-get install -y --no-install-recommends ca-certificates sudo
ENV DEBIAN_FRONTEND teletype
USER developer
ADD sudoers.txt /etc/sudoers
WORKDIR /home/developer

# setup NodeJS and Neutralino
RUN wget https://nodejs.org/dist/v18.12.0/node-v18.12.0-linux-x64.tar.xz
RUN tar xf node-v18.12.0-linux-x64.tar.xz
RUN sudo cp node-v18.12.0-linux-x64/bin/* /usr/local/bin
RUN npm i -g @neutralinojs/neu

# project and dependencies
RUN mkdir work
WORKDIR /work
RUN git clone https://github.com/loloof64/BasicChessEndgamesNeutralino.git
WORKDIR /work/BasicChessEndgamesNeutralino
RUN npm i
RUN neu update

# building project
WORKDIR /work/BasicChessEndgamesNeutralino/frontend
RUN npm i
RUN npm run build
WORKDIR /work/BasicChessEndgamesNeutralino
RUN npm run build:neu

# building AppDir
RUN mkdir -p BasicChessEndgames.AppDir/usr/share/applications
RUN mkdir -p BasicChessEndgames.AppDir/usr/bin
RUN mkdir -p BasicChessEndgames.AppDir/usr/share/icons/hicolor/256x256/apps
RUN cp build_appimage/linux/x86_64/BasicChessEndgames.desktop BasicChessEndgames.AppDir
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
RUN cp build_appimage/linux/x86_64/AppRun BasicChessEndgames.AppDir/AppRun
RUN chmod 777 BasicChessEndgames.AppDir/AppRun
RUN mkdir -p BasicChessEndgames.AppDir/usr/share/glib-2.0
RUN cp -R /usr/share/glib-2.0/schemas BasicChessEndgames.AppDir/usr/share/glib-2.0

# fetching linuxdeploy
RUN wget https://github.com/linuxdeploy/linuxdeploy/releases/download/continuous/linuxdeploy-x86_64.AppImage
RUN chmod +x linuxdeploy-x86_64.AppImage

# first time running linuxdeploy in order to get shared libraries
RUN ./linuxdeploy-x86_64.AppImage --appimage-extract
WORKDIR /work/BasicChessEndgamesNeutralino/squashfs-root/usr/bin
RUN ./linuxdeploy --appdir ../../../BasicChessEndgames.AppDir/ -d ../../../BasicChessEndgames.AppDir/BasicChessEndgames.desktop -i ../../../BasicChessEndgames.AppDir/icon.png -o "appimage"

# symlink needed libraries
WORKDIR /work/BasicChessEndgamesNeutralino/BasicChessEndgames.AppDir
RUN mkdir -p usr/lib/x86_64-linux-gnu/
RUN ln -s usr/lib/libwebkit2gtk-4.0.so.37 usr/lib/x86_64-linux-gnu/libwebkit2gtk-4.0.so.37
RUN mkdir -p usr/lib/x86_64-linux-gnu/gio/modules/
RUN cp /usr/lib/x86_64-linux-gnu/gio/modules/libgvfsdbus.so usr/lib/x86_64-linux-gnu/gio/modules/libgvfsdbus.so
RUN cp /usr/lib/x86_64-linux-gnu/gio/modules/libgiolibproxy.so usr/lib/x86_64-linux-gnu/gio/modules/libgiolibproxy.so
RUN cp /usr/lib/x86_64-linux-gnu/gio/modules/libgiognomeproxy.so usr/lib/x86_64-linux-gnu/gio/modules/libgiognomeproxy.so
RUN cp /usr/lib/x86_64-linux-gnu/gio/modules/libgiognutls.so usr/lib/x86_64-linux-gnu/gio/modules/libgiognutls.so

# second time running linuxdeploy in order to integrate the symlink
WORKDIR /work/BasicChessEndgamesNeutralino/squashfs-root/usr/bin
RUN ./linuxdeploy --appdir ../../../BasicChessEndgames.AppDir/ -d ../../../BasicChessEndgames.AppDir/BasicChessEndgames.desktop -i ../../../BasicChessEndgames.AppDir/icon.png -o "appimage"

# copying the AppImage in the root of project folder
WORKDIR /work/BasicChessEndgamesNeutralino
RUN mv squashfs-root/usr/bin/*.AppImage /output_binary