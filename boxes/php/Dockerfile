FROM esolang/base

RUN apk add --update php7 && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/php

COPY script /root/script
