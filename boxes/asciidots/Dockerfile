FROM esolang/python3

RUN /usr/bin/python3 -m pip install --upgrade pip && \
    /usr/bin/python3 -m pip install asciidots && \
    rm -rf /var/cache/apk/* /tmp/*

COPY script /bin/script

RUN ln -s /bin/script /bin/asciidots && \
    chmod 744 /bin -R
