FROM esolang/base

RUN apk add --update bc && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/bc

COPY script /root/script
