FROM esolang/build-base

ENV BUILD_PACKAGES="db-dev" \
    RUNTIME_PACKAGES="db gmp-dev libxml2-dev json-c-dev ncurses-dev"

RUN apk add --update $BUILD_PACKAGES $RUNTIME_PACKAGES && \
    cd /tmp && \
    curl -m $TIMEOUT https://ftp.gnu.org/gnu/gnucobol/gnucobol-3.2.tar.gz -LO && \
    tar xf gnucobol-3.2.tar.gz && \
    cd gnucobol-3.2 && \
    ./configure && \
    make && \
    make install && \
    apk del $BUILD_PACKAGES && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/cobol

COPY script /root/script
