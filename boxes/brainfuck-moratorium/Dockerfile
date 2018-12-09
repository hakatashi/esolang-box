FROM esolang/build-base

ENV BUILD_PACKAGES="cmake" \
    RUNTIME_PACKAGES="python2"

RUN apk add --update $BUILD_PACKAGES $RUNTIME_PACKAGES && \
# install keystone & its python binding \
    git clone --depth 1 git://github.com/keystone-engine/keystone ~/keystone && \
    sh -c 'mkdir ~/keystone/build && cd ~/keystone/build && ../make-share.sh && make install && ln -s /usr/local/lib64/libkeystone* /usr/lib' && \
    make install -C ~/keystone/bindings/python && \
# install compiler \
    git clone --depth 1 https://gist.github.com/a7f73d3c4d61ccba05c29a6b2b5e36f9.git ~/mora-bfc && \
    apk del $BUILD_PACKAGES && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/brainfuck-moratorium

COPY script /root/script
