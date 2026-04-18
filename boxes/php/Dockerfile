FROM esolang/base

RUN apk add --update php85 --repository http://dl-cdn.alpinelinux.org/alpine/edge/community && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/php

COPY script /root/script
