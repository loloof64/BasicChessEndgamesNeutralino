FROM ubuntu:18.04

RUN apt update
RUN apt install git curl wget -y
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
#RUN yarn bundle:appimage