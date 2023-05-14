FROM esolang/haskell

ENV BUILD_PACKAGES="musl-dev make xz ncurses-dev ncurses-libs" \
    RUNTIME_PACKAGES="" \
    PATH=/root/.opam/4.03.0/bin:$PATH

RUN rm /bin/haskell && \
    apk add --update $BUILD_PACKAGES $RUNTIME_PACKAGES && \
    ln -s /usr/lib/libncursesw.so.6 /usr/lib/libtinfo.so.6 && \
    curl -L https://get.haskellstack.org/stable/linux-x86_64.tar.gz -o stack.tar.gz && \
    mkdir /tmp/stack-install && \
    tar xf stack.tar.gz --strip-components=1 -C /tmp/stack-install
    
RUN cp /tmp/stack-install/stack /usr/bin/stack
RUN git clone --depth 1 https://gitlab.com/fogity/squared-cool.git /tmp/squared-cool && \
    apk add --update cabal
RUN cd /tmp/squared-cool && \
#    echo 'system-ghc: true' >> stack.yaml && \
    stack setup --verbose && \
    stack build --verbose && \
    apk del $BUILD_PACKAGES && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/squared-cool

COPY script /root/script
