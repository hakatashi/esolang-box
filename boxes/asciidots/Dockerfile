FROM esolang/python3

RUN /usr/bin/python3 -m pip install --upgrade pip && \
    /usr/bin/python3 -m pip install asciidots && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/asciidots

COPY script /root/script
