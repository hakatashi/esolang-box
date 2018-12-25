FROM esolang/node

ENV BUILD_PACKAGES="npm" \
    RUNTIME_PACKAGES=""

RUN apk add --update $BUILD_PACKAGES $RUNTIME_PACKAGES && \
    rm /bin/node && \
    git clone --depth 1 https://github.com/colinjeanne/stop-lang.git ~/stop-lang && \
    cd ~/stop-lang && \
    npm install && \
    npm run build:umd && \
    apk del $BUILD_PACKAGES && \
    rm -rf node_modules /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/stop

COPY stop-cli.js /root/stop-cli.js

COPY script /root/script
