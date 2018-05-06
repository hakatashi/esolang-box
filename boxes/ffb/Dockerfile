FROM esolang/python2

ENV BUILD_PACKAGES="recode" \
    RUNTIME_PACKAGES="py2-pip"

RUN apk add $BUILD_PACKAGES $RUNTIME_PACKAGES && \
    curl -m $TIMEOUT "https://esolangs.org/wiki/User:Sgeo/ffbimp" -L | awk -F "</?pre>" '{print $2}' RS="b\bb" | recode HTML..u8 > ~/ffb.py && \
    /usr/bin/python -m pip install --upgrade pip && \
    /usr/bin/python -m pip install pyparsing && \
    apk del $BUILD_PACKAGES && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/ffb

COPY script /root/script
