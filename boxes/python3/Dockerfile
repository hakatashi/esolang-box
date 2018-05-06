FROM esolang/base

RUN apk add --update python3 && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/python3

COPY script /root/script
