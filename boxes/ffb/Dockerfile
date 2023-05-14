FROM esolang/python3

ENV BUILD_PACKAGES="recode" \
    RUNTIME_PACKAGES="py3-parsing"

RUN apk add $BUILD_PACKAGES $RUNTIME_PACKAGES && \
    git clone https://github.com/hiromi-mi/ffb-impl && \
    apk del $BUILD_PACKAGES && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/ffb

COPY script /root/script
