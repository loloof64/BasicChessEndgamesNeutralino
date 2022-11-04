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
RUN ls -la build_appimage/linux/x86_64
RUN chmod +x build_appimage/linux/x86_64/AppImageBuilding.sh
CMD [ "sh", "build_appimage/linux/x86_64/AppImageBuilding.sh" ]