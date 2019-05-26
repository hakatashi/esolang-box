FROM esolang/build-base

ENV BUILD_PACKAGES="m4 libffi-dev sqlite-dev gdbm-dev" \
    RUNTIME_PACKAGES=""

RUN apk add --update $BUILD_PACKAGES $RUNTIME_PACKAGES && \
    cd /tmp && \
    curl -m $TIMEOUT ftp://ftp.ultimate.com/snobol/snobol4-2.0.tar.gz -LO && \
    tar xf snobol4-2.0.tar.gz && \
    cd snobol4-2.0 && \
    ./configure && \
    make && \
    make install && \
    apk del $BUILD_PACKAGES && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/snobol

COPY script /root/script
