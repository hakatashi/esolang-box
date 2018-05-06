FROM esolang/build-base

RUN cd /tmp && \
    mkdir -p blc && \
    cd blc && \
    curl -m $TIMEOUT http://www.ioccc.org/2012/tromp/Makefile -LO && \
    curl -m $TIMEOUT http://www.ioccc.org/2012/tromp/tromp.c -LO && \
    make tromp64 && \
    mv tromp64 /usr/bin/tromp64 && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/blc

COPY script /bin/script

