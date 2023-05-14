FROM esolang/base

RUN apk add --update python2 --repository http://dl-cdn.alpinelinux.org/alpine/v3.15/community && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/python2

COPY script /root/script
