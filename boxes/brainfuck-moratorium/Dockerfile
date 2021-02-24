FROM esolang/build-base

ENV BUILD_PACKAGES="" \
    RUNTIME_PACKAGES="keystone python3 keystone-python"

RUN apk add --update $BUILD_PACKAGES $RUNTIME_PACKAGES --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing && \
    #git clone --depth 1 https://gist.github.com/a7f73d3c4d61ccba05c29a6b2b5e36f9.git ~/mora-bfc && \
    mkdir -p ~/mora-bfc && \
    apk del $BUILD_PACKAGES && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/brainfuck-moratorium

COPY bf.py /root/mora-bfc/bf.py
COPY script /root/script
