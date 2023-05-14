FROM esolang/build-base

ENV BUILD_PACKAGES="fish" \
    RUNTIME_PACKAGES="python3"

RUN apk add $BUILD_PACKAGES $RUNTIME_PACKAGES && \
    wget https://olivier.sessink.nl/jailkit/jailkit-2.23.tar.gz && \
    tar xf jailkit-2.23.tar.gz && \
    cd jailkit-2.23 && \
    ./configure && make && make install && \
    mkdir -p /opt/jails/fish-shell-pure && \
    jk_init -j /opt/jails/fish-shell-pure uidbasics && \
    mkdir -p /opt/jails/fish-shell-pure/bin && \
    cp /usr/bin/fish /opt/jails/fish-shell-pure/bin/ && \
    mkdir -p /opt/jails/fish-shell-pure/lib && \
    cp /lib/ld-musl-x86_64.so.1 /opt/jails/fish-shell-pure/lib/ && \
    cp /usr/lib/libncursesw.so.6 /opt/jails/fish-shell-pure/lib/ && \
    cp /usr/lib/libstdc++.so.6 /opt/jails/fish-shell-pure/lib/ && \
    cp /usr/lib/libgcc_s.so.1 /opt/jails/fish-shell-pure/lib/ && \
    cp /usr/lib/libpcre2-32.so.0 /opt/jails/fish-shell-pure/lib/ && \
    apk del $BUILD_PACKAGES && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/fish-shell-pure

COPY script /root/script
