FROM esolang/build-base

ENV BUILD_PACKAGES="openssl-dev readline-dev zlib-dev linux-headers" \
    RUNTIME_PACKAGES=""

RUN apk add --update $BUILD_PACKAGES $RUNTIME_PACKAGES && \
    cd /tmp && \
    curl https://cache.ruby-lang.org/pub/ruby/3.0/ruby-3.0.0.tar.gz -O && \
    tar xzf ruby-3.0.0.tar.gz && \
    cd ruby-3.0.0 && \
    (./configure > /tmp/configure.log) && \
    (make golf -j5 > /tmp/make.log) && \
    (make install > /tmp/make-install.log) && \
    cp goruby ~/goruby && \
    apk del $BUILD_PACKAGES && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/goruby

COPY script /root/script
