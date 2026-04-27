FROM esolang/build-base

ENV BUILD_PACKAGES="npm" \
    RUNTIME_PACKAGES="nodejs ocaml python3 ninja"

RUN apk add $BUILD_PACKAGES $RUNTIME_PACKAGES && \
    apk add --update gcc=14.2.0-r6 --repository http://dl-cdn.alpinelinux.org/alpine/v3.22/main && \
    npm install -g bs-platform && \
    apk del $BUILD_PACKAGES && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/rescript

COPY script /root/script
