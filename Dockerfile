FROM node:6.9.5
MAINTAINER Damian Baćkowski <damianbackowski@gmail.com>

ENV CHROME_PACKAGE="google-chrome-stable_56.0.2924.87-1_amd64.deb"
ENV DBUS_SESSION_BUS_ADDRESS=/dev/null

RUN apt-get update && \
    apt-get install -y xvfb wget openjdk-8-jre && \
    wget https://github.com/webnicer/chrome-downloads/raw/master/x64.deb/${CHROME_PACKAGE} && \
    dpkg --unpack ${CHROME_PACKAGE} && \
    apt-get install -f -y && \
    apt-get clean && \
    rm ${CHROME_PACKAGE}