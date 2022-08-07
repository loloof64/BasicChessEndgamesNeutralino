FROM ubuntu:18.04

RUN apt update
RUN apt install git curl wget -y
RUN apt install libwebkit2gtk-4.0-37 -y
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash -
RUN apt install nodejs -y
RUN npm i -g yarn
RUN yarn global add @neutralinojs/neu

RUN mkdir work
WORKDIR /work
RUN git clone https://github.com/loloof64/BasicChessEndgamesNeutralino.git
WORKDIR /work/BasicChessEndgamesNeutralino
RUN yarn
RUN neu update

WORKDIR /work/BasicChessEndgamesNeutralino/frontend
RUN yarn
RUN yarn build
WORKDIR /work/BasicChessEndgamesNeutralino
RUN yarn build:neu

RUN mkdir -p BasicChessEndgames.AppDir/usr/share/applications
RUN mkdir -p BasicChessEndgames.AppDir/usr/bin
RUN mkdir -p BasicChessEndgames.AppDir/usr/share/icons/hicolor/256x256/apps
RUN cp BasicChessEndgames.desktop BasicChessEndgames.AppDir/usr/share/applications
RUN cp frontend/public/icon.png BasicChessEndgames.AppDir/usr/share/icons/hicolor/256x256/apps
RUN cp dist/basic-chess-endgames/basic-chess-endgames-linux_x64 BasicChessEndgames.AppDir/usr/bin
RUN cp dist/basic-chess-endgames/resources.neu BasicChessEndgames.AppDir/usr/bin
WORKDIR /work/BasicChessEndgamesNeutralino/BasicChessEndgames.AppDir
RUN ln -s usr/bin/basic-chess-endgames-linux_x64 AppRun
RUN ln -s usr/share/icons/hicolor/256x256/apps/icon.png .

WORKDIR /work/BasicChessEndgamesNeutralino
RUN wget https://github.com/AppImage/AppImageKit/releases/download/continuous/appimagetool-x86_64.AppImage
RUN wget https://github.com/linuxdeploy/linuxdeploy/releases/download/continuous/linuxdeploy-x86_64.AppImage
RUN chmod +x appimagetool-x86_64.AppImage
RUN chmod +x linuxdeploy-x86_64.AppImage

RUN ./linuxdeploy-x86_64.AppImage --appimage-extract
WORKDIR /work/BasicChessEndgamesNeutralino/squashfs-root/usr/bin
# RUN ./linuxdeploy --appdir ../../../BasicChessEndgames.AppDir/ -d ../../../BasicChessEndgames.AppDir/usr/share/applications/BasicChessEndgames.desktop -i ../../../BasicChessEndgames.AppDir/icon.png -o "appimage"


#RUN ./appimagetool-x86_64.AppImage --appimage-extract