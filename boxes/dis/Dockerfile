FROM esolang/build-base

RUN cd /tmp && \
    curl -m $TIMEOUT "http://web.archive.org/web/20031209180058/http://www.mines.edu/students/b/bolmstea/malbolge/dis.tar.gz" -LO && \
    tar xzf dis.tar.gz && \
    gcc -O2 -Wall dis/dis.c -o dis.out && \
    mv dis.out ~/dis && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/dis

COPY script /root/script
