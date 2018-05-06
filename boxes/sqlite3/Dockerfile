FROM esolang/build-base

RUN cd /tmp && \
    curl -m $TIMEOUT https://sqlite.org/2017/sqlite-autoconf-3200000.tar.gz -LO && \
    tar xzf sqlite-autoconf-3200000.tar.gz && \
    cd sqlite-autoconf-3200000 && \
    ./configure && \
    make && \
    mv sqlite3 /usr/bin/sqlite3 && \
    rm -rf /var/cache/apk/* /tmp/*

COPY script /bin/script

RUN ln -s /bin/script /bin/sqlite3 && \
    chmod 744 /bin -R
