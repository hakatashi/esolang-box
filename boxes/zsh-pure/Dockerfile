FROM esolang/python2

ENV BUILD_PACKAGES="zsh" \
    RUNTIME_PACKAGES=""

RUN apk add $BUILD_PACKAGES $RUNTIME_PACKAGES && \
    apk add --update jailkit --repository http://dl-cdn.alpinelinux.org/alpine/v3.10/community && \
    mkdir -p /opt/jails/zsh-pure && \
    jk_init -j /opt/jails/zsh-pure uidbasics && \
    mkdir -p /opt/jails/zsh-pure/bin && \
    cp /bin/zsh /opt/jails/zsh-pure/bin/ && \
    mkdir -p /opt/jails/zsh-pure/lib && \
    cp /lib/ld-musl-x86_64.so.1 /opt/jails/zsh-pure/lib/ && \
    cp /usr/lib/libncursesw.so.6 /opt/jails/zsh-pure/lib/ && \
    apk del $BUILD_PACKAGES && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/zsh-pure

COPY script /root/script
