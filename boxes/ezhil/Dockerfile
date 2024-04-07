FROM esolang/python3

ENV BUILD_PACKAGES="" \
    RUNTIME_PACKAGES="py3-pip"

RUN apk add $BUILD_PACKAGES $RUNTIME_PACKAGES && \
    rm -f /bin/python3 && \
    apk add --update bash && \
    cd /tmp && \
    git clone --depth 1 https://github.com/Ezhil-Language-Foundation/Ezhil-Lang.git Ezhil-Lang && \
    cd Ezhil-Lang && \
    sed -i 's/collections.Callable/collections.abc.Callable/g' ezhil/Interpreter.py && \
    python3 -m pip install . --break-system-packages && \
    ln -s /bin/script /bin/ezhil

COPY script /root/script
