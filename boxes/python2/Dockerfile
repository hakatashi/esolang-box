FROM esolang/build-base

ENV BUILD_PACKAGES="libffi-dev openssl-dev bzip2-dev zlib-dev readline-dev sqlite-dev" \
    RUNTIME_PACKAGES=""

RUN apk add $BUILD_PACKAGES $RUNTIME_PACKAGES && \
    apk add --update gcc=14.2.0-r6 --repository http://dl-cdn.alpinelinux.org/alpine/v3.22/main && \
    git clone --depth 1 https://github.com/pyenv/pyenv.git /tmp/pyenv && \
    /tmp/pyenv/bin/pyenv install 2.7.18 && \
    apk del $BUILD_PACKAGES && \
    rm -rf /var/cache/apk/* /tmp/* /usr/bin/python && \
    ln -s /root/.pyenv/versions/2.7.18/bin/python /usr/bin/python && \
    ln -s /bin/script /bin/python2

COPY script /root/script
