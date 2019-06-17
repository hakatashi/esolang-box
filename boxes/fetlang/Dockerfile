FROM esolang/build-base

ENV BUILD_PACKAGES="ninja meson boost" \
    RUNTIME_PACKAGES=""

RUN apk add --update $BUILD_PACKAGES $RUNTIME_PACKAGES && \
    cd /tmp && \
    git clone --depth 1 https://github.com/fetlang/fetlang.git && \
    cd fetlang && \
    meson --buildtype=release src build && \
    cd build && \
    ninja && \
    ninja install && \
    apk del $BUILD_PACKAGES && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/fetlang

COPY script /root/script
