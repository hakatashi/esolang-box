FROM esolang/python3

RUN /usr/bin/python3 -m pip install --upgrade pip && \
    /usr/bin/python3 -m pip install mines-esolang && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/mines

COPY script /root/script
