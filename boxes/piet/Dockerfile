FROM esolang/build-base

ENV BUILD_PACKAGES="libpng-dev gd-dev giflib-dev" \
    RUNTIME_PACKAGES="libpng libgd giflib"

RUN apk add --update $BUILD_PACKAGES $RUNTIME_PACKAGES && \
    cd /tmp && \
    curl -m $TIMEOUT http://www.bertnase.de/npiet/npiet-1.3e.tar.gz -LO && \
    tar xzf npiet-1.3e.tar.gz && \
    cd npiet-1.3e && \
    ./configure && \
    make npiet && \
    mv npiet ~/npiet && \
    apk del $BUILD_PACKAGES && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/piet

COPY script /root/script
