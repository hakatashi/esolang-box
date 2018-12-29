FROM esolang/build-base

ENV BUILD_PACKAGES="ghc" \
    RUNTIME_PACKAGES="libffi"

RUN apk add --update $BUILD_PACKAGES $RUNTIME_PACKAGES && \
    git clone --depth 1 https://github.com/TryItOnline/WSpace.git /tmp/WSpace && \
    cd /tmp/WSpace && \
    make && \
    cp wspace /usr/bin/whitespace && \
    apk del $BUILD_PACKAGES && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/whitespace

COPY script /root/script
