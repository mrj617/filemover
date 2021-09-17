FROM alpine:3.14

#Move crontab file to folder
COPY ./crontab.bak .

#Install Dependencies & run crontab
RUN crontab crontab.bak &&\
    apk add busybox-initscripts &&\
    apk add openrc --no-cache &&\
    rc-update add crond

#Folders that will be created and can be mapped to user directories
VOLUME [ "/moveFolder1" ]

VOLUME [ "/receiveFolder1" ]

VOLUME [ "/moveFolder2" ]

VOLUME [ "/receiveFolder2" ]

WORKDIR /

ENTRYPOINT ["tail"]
CMD ["-f","/dev/null"]