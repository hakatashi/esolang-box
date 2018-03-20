FROM esolang/build-base

ENV BUILD_PACKAGES="openssl-dev readline-dev zlib-dev" \
    RUNTIME_PACKAGES="libpthread"

RUN apk add --update $BUILD_PACKAGES $RUNTIME_PACKAGES && \
    cd /tmp && \
    git clone https://github.com/rbenv/ruby-build.git && \
    sh -c "PREFIX=/tmp ./ruby-build/install.sh" && \
    /tmp/bin/ruby-build 2.5.0 /usr/local/ruby-2.5.0 && \
    apk del $BUILD_PACKAGES && \
    rm -rf /var/cache/apk/* /tmp/*

COPY script /bin/script

RUN ln -s /bin/script /bin/ruby && \
    chmod 744 /bin -R

WORKDIR /root

CMD [ "script" ]
