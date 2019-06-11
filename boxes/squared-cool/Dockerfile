FROM esolang/haskell

ENV BUILD_PACKAGES="musl-dev make xz" \
    RUNTIME_PACKAGES="" \
    PATH=/root/.opam/4.03.0/bin:$PATH

RUN rm /bin/haskell && \
    apk add --update $BUILD_PACKAGES $RUNTIME_PACKAGES && \
    (curl -sSL https://get.haskellstack.org/ | sh) && \
    git clone --depth 1 https://gitlab.com/fogity/squared-cool.git && \
    cd squared-cool && \
    mkdir -p ~/.stack && \
    echo 'system-ghc: true' >> ~/.stack/config.yaml && \
    stack setup && \
    stack build && \
    apk del $BUILD_PACKAGES && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/squared-cool

COPY script /root/script
