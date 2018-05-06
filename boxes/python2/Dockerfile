FROM esolang/base

RUN apk add --update python2 && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/python2

COPY script /root/script
