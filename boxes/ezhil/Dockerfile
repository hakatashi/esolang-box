FROM esolang/python2

RUN rm /bin/python2 && \
    apk add --update bash && \
    (curl https://bootstrap.pypa.io/get-pip.py | /usr/bin/python) && \
    cd /tmp && \
    git clone --depth 1 https://github.com/Ezhil-Language-Foundation/Ezhil-Lang.git Ezhil-Lang && \
    cd Ezhil-Lang && \
    python2 -m pip install . && \
    ln -s /bin/script /bin/ezhil

COPY script /root/script
