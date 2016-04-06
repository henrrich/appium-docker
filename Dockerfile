FROM node:5.10.1

ARG APPIUM_VERSION

ADD . /root
WORKDIR /root

RUN /root/setup.sh
