FROM esolang/build-base

ENV BUILD_PACKAGES="python2" \
    RUNTIME_PACKAGES=""

RUN apk add $BUILD_PACKAGES $RUNTIME_PACKAGES && \
    cd /tmp && \
    git clone --recursive --depth 1 https://github.com/wren-lang/wren-cli.git

RUN cd /tmp/wren-cli/projects/make && \
    make

RUN mv /tmp/wren-cli/bin/wren_cli /root/wren && \
    apk del $BUILD_PACKAGES && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/wren

COPY script /root/script
