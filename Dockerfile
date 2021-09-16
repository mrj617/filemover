FROM alpine:3.14

COPY ./crontab.bak .

RUN crontab crontab.bak &&\
    apk add busybox-initscripts &&\
    apk add openrc --no-cache &&\
    rc-update add crond

VOLUME [ "/moveFolder1" ]

VOLUME [ "/receiveFolder1" ]
