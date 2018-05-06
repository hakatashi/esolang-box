FROM esolang/build-base

RUN apk add --update rust && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/rust

COPY script /root/script
