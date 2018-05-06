FROM esolang/build-base

RUN apk add boost-dev perl && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/doubleplusungood

COPY script /bin/script

