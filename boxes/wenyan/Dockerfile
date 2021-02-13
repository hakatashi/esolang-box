FROM esolang/node

ENV BUILD_PACKAGES="npm" \
    RUNTIME_PACKAGES=""

RUN apk add $BUILD_PACKAGES $RUNTIME_PACKAGES && \
    rm /bin/node && \
    npm install -g @wenyanlang/cli @wenyanlang/wyg --unsafe && \
    /usr/bin/wyg i 交互秘術 && \
    apk del $BUILD_PACKAGES && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/wenyan

COPY script /root/script
