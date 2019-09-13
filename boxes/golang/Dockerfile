FROM esolang/base

RUN apk add --update go musl-dev && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/golang

COPY script /root/script