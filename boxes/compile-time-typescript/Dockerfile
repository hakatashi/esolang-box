FROM esolang/node

ENV BUILD_PACKAGES="npm" \
    RUNTIME_PACKAGES=""

RUN apk add --update $BUILD_PACKAGES $RUNTIME_PACKAGES && \
    rm /bin/node && \
    git clone --depth 1 https://github.com/n4o847/compile-time-typescript.git -b v1.1.1 ~/compile-time-typescript && \
    cd ~/compile-time-typescript && \
    npm install && \
    apk del $BUILD_PACKAGES && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/compile-time-typescript

COPY script /root/script
