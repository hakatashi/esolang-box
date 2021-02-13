FROM esolang/python2

ENV BUILD_PACKAGES="bash" \
    RUNTIME_PACKAGES=""

RUN apk add $BUILD_PACKAGES $RUNTIME_PACKAGES && \
    apk add --update jailkit --repository http://dl-cdn.alpinelinux.org/alpine/v3.10/community && \
    mkdir -p /opt/jails/bash-pure && \
    jk_init -j /opt/jails/bash-pure uidbasics && \
    mkdir -p /opt/jails/bash-pure/bin && \
    cp /bin/bash /opt/jails/bash-pure/bin/bash && \
    mkdir -p /opt/jails/bash-pure/lib && \
    cp /lib/ld-musl-x86_64.so.1 /opt/jails/bash-pure/lib/ && \
    cp /usr/lib/libreadline.so.8 /opt/jails/bash-pure/lib/ && \
    cp /usr/lib/libncursesw.so.6 /opt/jails/bash-pure/lib/ && \
    apk del $BUILD_PACKAGES && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/bash-pure

COPY script /root/script
