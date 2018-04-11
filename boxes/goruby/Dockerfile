FROM esolang/build-base

ENV BUILD_PACKAGES="openssl-dev readline-dev zlib-dev linux-headers" \
    RUNTIME_PACKAGES=""

RUN apk add --update $BUILD_PACKAGES $RUNTIME_PACKAGES && \
    cd /tmp && \
    curl -m $TIMEOUT https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.0.tar.gz -O && \
    tar xzf ruby-2.5.0.tar.gz && \
    cd ruby-2.5.0 && \
    (./configure > /tmp/configure.log) && \
    (make golf -j5 > /tmp/make.log) && \
    (make install > /tmp/make-install.log) && \
    cp goruby ~/goruby && \
    apk del $BUILD_PACKAGES && \
    rm -rf /var/cache/apk/* /tmp/*

COPY script /bin/script

RUN ln -s /bin/script /bin/goruby && \
    chmod 744 /bin -R

WORKDIR /root

CMD [ "script" ]
