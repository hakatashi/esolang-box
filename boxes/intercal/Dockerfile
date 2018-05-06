FROM esolang/build-base

RUN cd /tmp && \
    curl -m $TIMEOUT http://www.catb.org/~esr/intercal/intercal-0.30.tar.gz -LO && \
    mkdir -p ~/intercal && \
    tar xzf intercal-0.30.tar.gz -C ~/intercal && \
    cd ~/intercal/intercal-0.30 && \
    ./configure && \
    make && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/intercal

COPY script /bin/script

