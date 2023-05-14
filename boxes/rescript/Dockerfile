FROM esolang/build-base

ENV BUILD_PACKAGES="npm" \
    RUNTIME_PACKAGES="nodejs ocaml python3 ninja ocaml-dev"

RUN apk add $BUILD_PACKAGES $RUNTIME_PACKAGES && \
    npm install -g bs-platform --unsafe-perm && \
    apk del $BUILD_PACKAGES && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/rescript

COPY script /root/script
