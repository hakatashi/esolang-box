FROM esolang/node

ENV BUILD_PACKAGES="npm" \
    RUNTIME_PACKAGES=""

RUN apk add --update $BUILD_PACKAGES $RUNTIME_PACKAGES && \
    rm /bin/node && \
    git clone --depth 1 https://github.com/dzaima/Canvas.git && \
    cd Canvas && \
    npm install && \
    apk del $BUILD_PACKAGES && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/canvas

COPY script /root/script
