FROM esolang/base

RUN apk add --update mono --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/csharp

COPY script /root/script
