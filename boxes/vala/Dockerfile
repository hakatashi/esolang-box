FROM esolang/build-base

RUN apk add --no-cache vala && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/vala

COPY script /root/script
