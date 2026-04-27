FROM esolang/haskell

RUN apk add --update cabal musl-dev && \
    cabal update && \
    cabal install --lib bytestring containers dlist filepath mtl murmur-hash process split template-haskell && \
    cabal get memoize && \
    cd memoize-* && \
    sed -i 's/()/BndrVis/' src/Data/Function/Memoize/TH.hs && \
    cabal install --lib . && \
    cd /tmp && \
    curl -L http://golfscript.com/nibbles/nibbles-latest.tgz -o nibbles-latest.tgz && \
    tar xf nibbles-latest.tgz && \
    cd nibbles && \
    rm -rf Data && \
    ghc -O -package ghc nibbles.hs -o nibbles && \
    cp nibbles /root/ && \
    cd / && \
    apk del cabal && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/nibbles

COPY script /root/script
