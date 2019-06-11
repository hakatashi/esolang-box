FROM esolang/node

ENV BUILD_PACKAGES="npm" \
    RUNTIME_PACKAGES=""

RUN apk add --update $BUILD_PACKAGES $RUNTIME_PACKAGES && \
    rm /bin/node && \
    git clone --depth 1 https://bitbucket.org/wgunther/wysiscript.git && \
    npm install jsdom && \
    apk del $BUILD_PACKAGES && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/wysiscript

COPY wysiscript-cli.js /root/wysiscript-cli.js

COPY script /root/script
