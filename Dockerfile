FROM node:4.1.2

ARG APPIUM_VERSION

ADD . /root
WORKDIR /root

RUN /root/setup.sh
