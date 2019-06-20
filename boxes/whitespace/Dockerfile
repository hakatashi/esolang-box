FROM esolang/haskell

ENV BUILD_PACKAGES="make musl-dev" \
    RUNTIME_PACKAGES="libffi python3"

RUN apk add --update $BUILD_PACKAGES $RUNTIME_PACKAGES && \
    git clone --depth 1 https://github.com/TryItOnline/WSpace.git /tmp/WSpace && \
    cd /tmp/WSpace && \
    make && \
    cp wspace /usr/bin/whitespace && \
    curl -L https://github.com/hostilefork/whitespacers/raw/master/python/interpreter.py -o ~/interpreter.py && \
    sed -i "s/import msvcrt//" ~/interpreter.py && \
    apk del $BUILD_PACKAGES && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/whitespace

COPY script /root/script
COPY disasm /root/disasm
