FROM esolang/base

RUN echo "https://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories && \
    apk add --update --no-cache python3 && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/python3

COPY script /root/script
