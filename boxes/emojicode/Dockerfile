FROM esolang/build-base

ENV BUILD_PACKAGES="cmake llvm8 llvm8-dev llvm8-static ninja zlib-dev python3 bash rsync ncurses" \
    RUNTIME_PACKAGES="" \
    TERM="dumb"

RUN apk add --update $BUILD_PACKAGES $RUNTIME_PACKAGES && \
    cd /tmp && \
    git clone https://github.com/emojicode/emojicode.git --depth 1 -b v1.0-beta.2 && \
    cd emojicode && \
    mkdir -p build && \
    cd build && \
    cmake .. -GNinja && \
    ninja -j5 && \
    mkdir -p /usr/local/include/emojicode && \
    ninja magicinstall && \
    apk del $BUILD_PACKAGES && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/emojicode

COPY script /root/script
