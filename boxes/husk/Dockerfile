FROM esolang/haskell

ENV BUILD_PACKAGES="musl-dev" \
    RUNTIME_PACKAGES=""

RUN rm /bin/haskell && \
    apk add --update $BUILD_PACKAGES $RUNTIME_PACKAGES && \
    cd /tmp && \
    git clone --depth 1 https://github.com/barbuz/Husk.git && \
    cd Husk && \
    ghc Husk.hs && \
    cp Husk /root/ && \
    cp revdictionary.tsv /root/ && \
    apk del $BUILD_PACKAGES && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/husk

COPY script /root/script
