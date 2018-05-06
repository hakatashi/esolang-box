FROM esolang/python2

ENV BUILD_PACKAGES="recode perl" \
    RUNTIME_PACKAGES=""

RUN apk add $BUILD_PACKAGES $RUNTIME_PACKAGES && \
    curl -m $TIMEOUT "https://esolangs.org/wiki/User:Marinus/Minimal-2D_interpreter" -L | awk -F "</?pre>" '{print $2}' RS="b\bb" | recode HTML..u8 | perl -i.bak -pe 's/[^[:ascii:]]//g' > ~/Minimal-2D.py && \
    apk del $BUILD_PACKAGES && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/minimal2d && \
    rm /bin/python2

COPY script /bin/script

