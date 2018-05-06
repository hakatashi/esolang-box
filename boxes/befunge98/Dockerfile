FROM esolang/build-base

ENV BUILD_PACKAGES="cmake" \
    RUNTIME_PACKAGES=""

RUN apk add --update $BUILD_PACKAGES $RUNTIME_PACKAGES && \
    cd /tmp && \
    curl -m $TIMEOUT https://sourceforge.net/projects/cfunge/files/cfunge/0.9.0/cfunge-0.9.0.tar.bz2 -LO && \
    tar xjf cfunge-0.9.0.tar.bz2 && \
    cd cfunge-0.9.0 && \
    mkdir build && \
    cd build && \
    cmake .. && \
    make && \
    mv cfunge ~/cfunge && \
    apk del $BUILD_PACKAGES && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/befunge98

COPY script /root/script
