FROM esolang/base

RUN apk add --update lua5.3 && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/lua

COPY script /root/script
