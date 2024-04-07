FROM esolang/ruby

ENV BUILD_PACKAGES="openssl-dev readline-dev zlib-dev linux-headers autoconf libffi-dev yaml-dev" \
    RUNTIME_PACKAGES=""

ENV VERSION="3.3.0"

RUN apk add --update $BUILD_PACKAGES $RUNTIME_PACKAGES && \
    cd /tmp && \
    git clone --depth 1 https://github.com/rbenv/ruby-build.git && \
    sh -c "PREFIX=/tmp ./ruby-build/install.sh" && \
    PATH=/usr/local/ruby-latest/bin:$PATH /tmp/bin/ruby-build --verbose ${VERSION}-dev /usr/local/ruby-trunk && \
    apk del $BUILD_PACKAGES && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/ruby-trunk

COPY script /root/script
