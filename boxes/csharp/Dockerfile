FROM esolang/python2

RUN apk add --update mono --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing && \
    rm -rf /var/cache/apk/* /tmp/*

COPY script /bin/script

RUN ln -s /bin/script /bin/csharp && \
    chmod 744 /bin -R

WORKDIR /root

CMD [ "script" ]
