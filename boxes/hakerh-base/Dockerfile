FROM esolang/node

ENV BUILD_PACKAGES="npm" \
    RUNTIME_PACKAGES=""

RUN apk add --update $BUILD_PACKAGES $RUNTIME_PACKAGES && \
    rm /bin/node && \
    npm install @hakerh400/esolangs@v1.3.4 && \
    apk del $BUILD_PACKAGES && \
    rm -rf /var/cache/apk/* /tmp/*
