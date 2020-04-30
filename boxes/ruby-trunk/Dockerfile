FROM esolang/ruby

ENV BUILD_PACKAGES="openssl-dev readline-dev zlib-dev linux-headers autoconf" \
    RUNTIME_PACKAGES=""

RUN rm /bin/ruby && \
    apk add --update $BUILD_PACKAGES $RUNTIME_PACKAGES && \
    cd /tmp && \
    git clone --depth 1 https://github.com/rbenv/ruby-build.git && \
    sh -c "PREFIX=/tmp ./ruby-build/install.sh" && \
    PATH=/usr/local/ruby-2.7.1/bin:$PATH /tmp/bin/ruby-build 2.7.1-dev /usr/local/ruby-2.7.1-dev && \
    apk del $BUILD_PACKAGES && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/ruby-trunk

COPY script /root/script
