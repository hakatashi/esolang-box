FROM esolang/build-base

RUN cd /tmp && \
    mkdir -p blc && \
    cd blc && \
    curl -m $TIMEOUT http://www.ioccc.org/2012/tromp/tromp.c -LO && \
    cc -std=gnu90 -O3 -DA=500000 -m64 -DInt=long -DX=8 tromp.c -o tromp64 && \
    mv tromp64 /usr/bin/tromp64 && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/blc

COPY script /root/script
