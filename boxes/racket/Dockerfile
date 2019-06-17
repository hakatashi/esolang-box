FROM esolang/base

RUN apk add --update racket --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/racket

COPY script /root/script
