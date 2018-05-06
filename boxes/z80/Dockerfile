FROM esolang/build-base

RUN cd /tmp && \
    curl -m $TIMEOUT http://golf.shinh.org/z80golf.tgz -LO && \
    tar xzf z80golf.tgz && \
    cd z80golf/src && \
    make && \
    mv z80golf /usr/bin/z80golf && \
    rm -rf /var/cache/apk/* /tmp/*

COPY script /bin/script

RUN ln -s /bin/script /bin/z80 && \
    chmod 744 /bin -R
