FROM esolang/python3

RUN rm -f /bin/python3 && \
    apk add --update bash && \
    (curl https://bootstrap.pypa.io/get-pip.py | /usr/bin/python3) && \
    cd /tmp && \
    git clone --depth 1 https://github.com/Ezhil-Language-Foundation/Ezhil-Lang.git Ezhil-Lang && \
    cd Ezhil-Lang && \
    sed -i 's/collections.Callable/collections.abc.Callable/g' ezhil/Interpreter.py && \
    python3 -m pip install . && \
    ln -s /bin/script /bin/ezhil

COPY script /root/script
