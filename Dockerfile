FROM jumidlej/raspios-buster:latest

USER root
RUN apt-get update 
RUN apt-get install -y python3-pip
RUN apt-get install -y python-rpi.gpio
RUN apt-get install -y python3-rpi.gpio

WORKDIR /usr/src/app

RUN python3 -m pip install --upgrade pip

# RUN apt-get install -y qt5-default


# installing qt 5.15.2
RUN wget https://download.qt.io/official_releases/qt/5.15/5.15.2/single/qt-everywhere-src-5.15.2.tar.xz
RUN tar xf qt-everywhere-src-5.15.2.tar.xz
RUN apt-get install -y git 
RUN git config --global user.name "isantana3"
RUN git config --global user.email "iago39939@gmail.com"
RUN git clone https://github.com/oniongarlic/qt-raspberrypi-configuration.git
RUN cd qt-raspberrypi-configuration && make install DESTDIR=../qt-everywhere-src-5.15.2
RUN apt-get update 
RUN cd ..
RUN apt-get install -y build-essential libfontconfig1-dev libdbus-1-dev libfreetype6-dev libicu-dev libinput-dev libxkbcommon-dev libsqlite3-dev libssl-dev libpng-dev libjpeg-dev libglib2.0-dev

RUN apt-get install -y qt5-qmake

# Installing WebEngine
RUN git clone --single-branch --branch 5.15.4 https://invent.kde.org/qt/qt/qtwebengine.git
RUN cd qtwebengine/
RUN touch .gitignore
RUN git init
RUN git submodule update --init


# RUN git submodule init
# RUN git submodule update

RUN apt-get update 
RUN cd ..
RUN apt-get install -y flex bison gperf libre2-dev libnss3-dev nodejs libdrm-dev libxdamage-dev	
# "We had no luck with the default jumbo build system in 5.15, compiling failed with obscure errors that made no sense, so we disable it."
# RUN sed -i -e 's|use_jumbo_build=true|use_jumbo_build=false|' qt-everywhere-src-5.15.2/qtwebengine/src/buildtools/config/common.pri

# RUN /opt/Qt/5.15.2/bin/qmake qt-everywhere-src-5.15.2/qtwebengine -- -no-webengine-geolocation

# RUN make -j4 NINJAJOBS=-j4
# RUN make install


# Seria tão mais fácil se via pip funcionasse...
# RUN pip3 install PyQtWebEngine
# RUN apt-get install -y python3-pyqt5.qtwebengine

