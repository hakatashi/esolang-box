FROM esolang/base

ENV BUILD_PACKAGES="git bash gcc build-base openssl-dev readline-dev zlib-dev" \
    RUNTIME_PACKAGES=""

RUN apk add --update $BUILD_PACKAGES $RUNTIME_PACKAGES && \
    cd /tmp && \
    git clone https://github.com/rbenv/ruby-build.git && \
    sh -c "PREFIX=/tmp ./ruby-build/install.sh" && \
    /tmp/bin/ruby-build 2.5.0 /usr/local/ruby-2.5.0 && \
    apk del $BUILD_PACKAGES && \
    rm -rf /var/cache/apk/* /tmp/*

COPY script /bin/script

RUN ln -s /bin/script /bin/ruby2.5 && \
    chmod 744 /bin -R

WORKDIR /home

CMD [ "script" ]
