FROM esolang/build-base

RUN apk add --update ghc && \
    curl -m $TIMEOUT https://github.com/TryItOnline/WSpace/archive/master.zip -LO && \
    unzip master.zip -d ~/ && \
    cd  WSpace-master && \
    make && \
    cp wspace /usr/bin/whitespace && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/whitespace

COPY script /root/script
