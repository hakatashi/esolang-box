FROM esolang/build-base

ENV BUILD_PACKAGES="cmake"

RUN apk add --update $BUILD_PACKAGES && \
    cd /tmp && \
    git clone --depth 1 https://github.com/AnonymousAAArdvark/qi.git && \
    cd qi/src && \
    cmake . && \
    make && \
    mv qi /usr/bin/qi && \
    apk del $BUILD_PACKAGES && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/qi

COPY script /root/script
