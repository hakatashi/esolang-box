FROM esolang/build-base

ENV BUILD_PACKAGES="m4 libffi-dev sqlite-dev gdbm-dev" \
    RUNTIME_PACKAGES=""

ENV VERSION="2.3.1"

# create /usr/local/man/man3 to avoid errors at `make install`
RUN apk add --update $BUILD_PACKAGES $RUNTIME_PACKAGES && \
    cd /tmp && \
    curl -m $TIMEOUT https://ftp.ultimate.com/snobol/snobol4-${VERSION}.tar.gz -LO && \
    tar xf snobol4-${VERSION}.tar.gz && \
    cd snobol4-${VERSION} && \
    ./configure && \
    make && \
    mkdir -p /usr/local/man/man3/ && \
    make install && \
    apk del $BUILD_PACKAGES && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/snobol

COPY script /root/script
