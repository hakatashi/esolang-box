FROM esolang/build-base

RUN cd /tmp && \
    curl -m $TIMEOUT "https://web.archive.org/web/20160416214517/http://esoteric.voxelperfect.net/files/sceql/impl/sceql-0.1.c" -LO && \
    gcc -O2 -Wall sceql-0.1.c -o sceql && \
    mv sceql /usr/bin/sceql && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/sceql

COPY script /root/script
