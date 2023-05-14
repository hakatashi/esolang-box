FROM esolang/build-base

RUN cd /tmp && \
    curl -L -m $TIMEOUT "http://web.archive.org/web/20031209180058/http://www.mines.edu/students/b/bolmstea/malbolge/dis.tar.gz" -LO && \
    tar xf dis.tar.gz

# dis.tar.gz is not compressed.

RUN gcc -O2 -Wall /tmp/dis/dis.c -o dis.out && \
    mv dis.out ~/dis && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/dis

COPY script /root/script
