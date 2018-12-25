FROM esolang/node

ENV BUILD_PACKAGES="python2 build-base npm" \
    RUNTIME_PACKAGES=""

RUN apk add $BUILD_PACKAGES $RUNTIME_PACKAGES && \
    rm /bin/node && \
    npm install -g nadesiko3 --unsafe && \
    apk del $BUILD_PACKAGES && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/nadesiko

COPY script /root/script
