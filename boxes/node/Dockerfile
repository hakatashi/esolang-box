FROM esolang/base

RUN apk add --update nodejs && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/node

COPY script /root/script
