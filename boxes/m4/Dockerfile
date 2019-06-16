FROM esolang/base

RUN apk add --update m4 && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/m4

COPY script /root/script
