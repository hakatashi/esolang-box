FROM esolang/csharp

ENV BUILD_PACKAGES="build-base" \
    RUNTIME_PACKAGES=""

RUN apk add --update $BUILD_PACKAGES $RUNTIME_PACKAGES && \
    cd /tmp && \
    curl -m $TIMEOUT https://raw.github.com/toptensoftware/yazd/master/yazd.zip -LO && \
    unzip yazd.zip && \
    mv Build/Release/yazd/net46/yazd.exe /root && \
    curl -m $TIMEOUT http://golf.shinh.org/z80golf.tgz -LO && \
    tar xzf z80golf.tgz && \
    cd z80golf/src && \
    make && \
    mv z80golf /usr/bin/z80golf && \
    apk del $BUILD_PACKAGES && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/z80

COPY script /root/script
COPY disasm /root/disasm
