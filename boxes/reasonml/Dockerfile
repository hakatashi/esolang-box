FROM esolang/node

ENV BUILD_PACKAGES="npm samurai python3 g++ make" \
    RUNTIME_PACKAGES=""

RUN apk add $BUILD_PACKAGES $RUNTIME_PACKAGES && \
    rm /bin/node && \
    ln -s /usr/bin/python3 /usr/bin/python && \
    npm install -g bs-platform --unsafe-perm && \
    apk del $BUILD_PACKAGES && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/reasonml

COPY script /root/script
