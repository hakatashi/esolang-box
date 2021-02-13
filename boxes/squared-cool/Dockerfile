FROM esolang/haskell

ENV BUILD_PACKAGES="musl-dev make xz ncurses-dev ncurses-libs" \
    RUNTIME_PACKAGES="" \
    PATH=/root/.opam/4.03.0/bin:$PATH

RUN rm /bin/haskell && \
    apk add --update $BUILD_PACKAGES $RUNTIME_PACKAGES && \
    ln -s /usr/lib/libncursesw.so.6 /usr/lib/libtinfo.so.6 && \
    (curl -sSL https://raw.githubusercontent.com/commercialhaskell/stack/de2a7b694f07de7e6cf17f8c92338c16286b2878/etc/scripts/get-stack.sh | sh) && \
    git clone --depth 1 https://gitlab.com/fogity/squared-cool.git && \
    cd squared-cool && \
    echo 'system-ghc: true' >> stack.yaml && \
    stack setup --verbose && \
    stack build && \
    apk del $BUILD_PACKAGES && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/squared-cool

COPY script /root/script
