FROM esolang/build-base

RUN cd /tmp && \
    curl -m $TIMEOUT https://github.com/irori/lazyk/raw/master/lazyk.c -LO && \
    gcc -Wall -O2 lazyk.c -o lazyk && \
    mv lazyk /usr/bin/lazyk && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/lazyk

COPY script /root/script
