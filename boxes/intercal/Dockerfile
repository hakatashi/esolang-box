FROM esolang/build-base

RUN cd /tmp && \
    curl -m $TIMEOUT http://www.catb.org/~esr/intercal/intercal-0.30.tar.gz -LO && \
    mkdir -p ~/intercal && \
    tar xzf intercal-0.30.tar.gz -C ~/intercal && \
    cd ~/intercal/intercal-0.30 && \
    ./configure && \
    make && \
    rm -rf /var/cache/apk/* /tmp/*

COPY script /bin/script

RUN ln -s /bin/script /bin/intercal && \
    chmod 744 /bin -R

WORKDIR /root

CMD [ "script" ]
