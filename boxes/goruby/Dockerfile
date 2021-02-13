FROM esolang/build-base

ENV BUILD_PACKAGES="openssl-dev readline-dev zlib-dev linux-headers" \
    RUNTIME_PACKAGES=""

RUN apk add --update $BUILD_PACKAGES $RUNTIME_PACKAGES && \
    cd /tmp && \
    curl https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.1.tar.bz2 -O && \
    tar xjf ruby-2.7.1.tar.bz2 && \
    cd ruby-2.7.1 && \
    (./configure > /tmp/configure.log) && \
    (make golf -j5 > /tmp/make.log) && \
    (make install > /tmp/make-install.log) && \
    cp goruby ~/goruby && \
    apk del $BUILD_PACKAGES && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/goruby

COPY script /root/script
