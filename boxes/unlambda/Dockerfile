FROM esolang/build-base

RUN cd /tmp && \
    curl -m $TIMEOUT ftp://ftp.madore.org/pub/madore/unlambda/unlambda-2.0.0.tar.gz -LO && \
    tar xzf unlambda-2.0.0.tar.gz -C /tmp && \
    gcc -O2 -Wall -o /usr/bin/unlambda unlambda-2.0.0/c-refcnt/unlambda.c && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/unlambda

COPY script /root/script
