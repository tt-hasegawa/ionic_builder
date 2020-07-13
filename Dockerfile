FROM beevelop/android-nodejs:v10.15.1

MAINTAINER Maik Hummel <m@ikhummel.com>

ENV CORDOVA_VERSION 9.0.0
ENV IONIC_VERSION 4.12.0

WORKDIR "/tmp"

RUN npm i -g --unsafe-perm cordova@${CORDOVA_VERSION}


RUN apt-get update && apt-get install -y git bzip2 openssh-client && \
    npm i -g --unsafe-perm ionic@${IONIC_VERSION} && \
    npm install -g cordova@${CORDOVA_VERSION} && \
    npm install -g cordova-ios && \
    npm install -g firebase && \
    npm install -g cordova-res --unsafe-perm && \
    ionic --no-interactive config set -g daemon.updates false && \
    rm -rf /var/lib/apt/lists/* && apt-get clean
