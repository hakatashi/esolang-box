FROM esolang/build-base

ENV BUILD_PACKAGES="cmake" \
    RUNTIME_PACKAGES=""

RUN apk add --update $BUILD_PACKAGES $RUNTIME_PACKAGES && \
    cd /tmp && \
    curl -m $TIMEOUT http://sourceforge.net/projects/ring-lang/files/Ring%201.14/Fayed_Ring_1.14_LightRelease_SourceCode.zip -LO && \
    unzip Fayed_Ring_1.14_LightRelease_SourceCode.zip

RUN cd /tmp/ring/language && \
    mkdir build && cd build && \
    cmake .. && \
    make && \
    mv ring ~/ring && \
    mv libring.so /usr/lib/ && \
    apk del $BUILD_PACKAGES && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/ring

COPY script /root/script
