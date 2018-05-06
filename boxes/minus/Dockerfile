FROM esolang/build-base

RUN cd /tmp && \
    curl -m $TIMEOUT http://www.golfscript.com/minus/files/iminus.c -LO && \
    gcc -Wall -O2 iminus.c -o /usr/bin/iminus && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/minus

COPY script /bin/script

