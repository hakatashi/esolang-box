FROM esolang/python3

ENV BUILD_PACKAGES="" \
    RUNTIME_PACKAGES="py3-pip"

RUN apk add $BUILD_PACKAGES $RUNTIME_PACKAGES && \
    /usr/bin/python3 -m pip install --upgrade pip && \
    /usr/bin/python3 -m pip install asciidots && \
    apk del $BUILD_PACKAGES && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/asciidots

COPY script /root/script
