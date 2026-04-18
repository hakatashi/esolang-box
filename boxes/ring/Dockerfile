FROM esolang/build-base

RUN cd /tmp && \
    curl -m $TIMEOUT http://sourceforge.net/projects/ring-lang/files/Ring%201.22/Ring_1.22_LightRelease_SourceCode.zip -LO && \
    unzip Ring_1.22_LightRelease_SourceCode.zip && \
    cd /tmp/ring/language/build && \
    sed 's/\r//' buildgcc.sh | sh && \
    cp /tmp/ring/bin/ring ~/ring && \
    cp /tmp/ring/lib/libring.so /usr/lib/ && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/ring

COPY script /root/script
