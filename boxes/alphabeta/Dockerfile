FROM esolang/build-base

RUN cd /tmp && \
    git clone --depth 1 https://github.com/TryItOnline/alphabeta.git && \
    cd alphabeta && \
    make && \
    mv ab /root/ab && \
    apk del $BUILD_PACKAGES && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/alphabeta

COPY script /root/script
