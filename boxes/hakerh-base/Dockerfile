FROM esolang/node

ENV BUILD_PACKAGES="npm" \
    RUNTIME_PACKAGES=""

RUN apk add --update $BUILD_PACKAGES $RUNTIME_PACKAGES && \
    rm /bin/node && \
    npm install @hakerh400/esolangs@v1.4.18 && \
    # Monkey patch
    cat <(echo "delete global.navigator;") ~/node_modules/@hakerh400/esolangs/index.js > /tmp/index.js && \
    mv /tmp/index.js ~/node_modules/@hakerh400/esolangs/index.js && \
    apk del $BUILD_PACKAGES && \
    rm -rf /var/cache/apk/* /tmp/*
