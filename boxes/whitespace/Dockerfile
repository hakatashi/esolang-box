FROM esolang/haskell

ENV BUILD_PACKAGES="make go"

RUN apk add --update $BUILD_PACKAGES && \
    git clone --depth 1 https://github.com/TryItOnline/WSpace.git /tmp/WSpace && \
    cd /tmp/WSpace && \
    make && \
    cp wspace /usr/bin/whitespace && \
    git clone --depth 1 https://github.com/zorchenhimer/whitespace.git ~/whitespace && \
    cd ~/whitespace && \
    make && \
    apk del $BUILD_PACKAGES && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/whitespace

COPY script /root/script
COPY disasm /root/disasm
