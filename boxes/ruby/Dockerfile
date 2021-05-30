FROM esolang/build-base

ENV BUILD_PACKAGES="openssl-dev readline-dev zlib-dev linux-headers" \
    RUNTIME_PACKAGES=""

RUN apk add --update $BUILD_PACKAGES $RUNTIME_PACKAGES && \
    cd /tmp && \
    git clone --depth 1 https://github.com/rbenv/ruby-build.git && \
    sh -c "PREFIX=/tmp ./ruby-build/install.sh" && \
    /tmp/bin/ruby-build 3.0.0 /usr/local/ruby-latest && \
    apk del $BUILD_PACKAGES && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/ruby

COPY script /root/script
