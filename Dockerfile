FROM node:4.1.2

ADD . /root
WORKDIR /root

RUN /root/setup.sh
