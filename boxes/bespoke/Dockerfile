FROM esolang/python3

ENV BUILD_PACKAGES="" \
    RUNTIME_PACKAGES="py3-pip"

RUN apk add $BUILD_PACKAGES $RUNTIME_PACKAGES && \
    /usr/bin/python3 -m pip install --upgrade pip --break-system-packages && \
    /usr/bin/python3 -m pip install bespokelang --break-system-packages && \
    apk del $BUILD_PACKAGES && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/bespokelang

COPY script /root/script
