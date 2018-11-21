FROM esolang/base

RUN apk add --update ghc && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/haskell

COPY script /root/script
