FROM esolang/base

RUN apk add --update python2 && \
    rm -rf /var/cache/apk/* /tmp/*

COPY script /bin/script

RUN ln -s /bin/script /bin/python2 && \
    chmod 744 /bin -R

WORKDIR /root

CMD [ "script" ]
