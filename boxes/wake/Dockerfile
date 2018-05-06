FROM esolang/build-base

ENV BUILD_PACKAGES="pcre-dev" \
    RUNTIME_PACKAGES="pcre"

RUN apk add $BUILD_PACKAGES $RUNTIME_PACKAGES && \
    cd /tmp && \
    curl -m $TIMEOUT http://shinh.skr.jp/wake/wake.tgz -LO && \
    tar xzf wake.tgz && \
    g++ -O2 -Wall wake/wake.cc -o wake.out -lpcre && \
    mv wake.out /usr/bin/wake && \
    apk del $BUILD_PACKAGES && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/wake

COPY script /bin/script

