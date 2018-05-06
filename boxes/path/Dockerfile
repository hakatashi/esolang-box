FROM esolang/python2

RUN cd /tmp && \
    curl -m $TIMEOUT https://sourceforge.net/projects/pathlang/files/PATH/0.33/path-0.33.tar.gz -LO && \
    mkdir -p ~/path && \
    tar xzf path-0.33.tar.gz -C ~/path && \
    rm -rf /var/cache/apk/* /tmp/*

COPY script /bin/script

RUN ln -s /bin/script /bin/path && \
    rm /bin/python2 && \
    chmod 744 /bin -R
