FROM esolang/build-base

ENV BUILD_PACKAGES="cmake python2" \
    RUNTIME_PACKAGES="nodejs"

RUN apk add $BUILD_PACKAGES $RUNTIME_PACKAGES && \
    cd /tmp && \
    git clone --recursive --depth 1 https://github.com/WebAssembly/wabt && \
    cd wabt && \
    make gcc-release -j5 && \
    mv out/gcc/Release/wat2wasm /usr/bin/wat2wasm && \
    apk del $BUILD_PACKAGES && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/wat

COPY wasm-cli.js /root/wasm-cli.js

COPY script /root/script
