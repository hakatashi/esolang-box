FROM esolang/build-base

RUN cd /tmp && \
    curl -m $TIMEOUT http://legacy.python.org/download/releases/src/python1.0.1.tar.gz -LO && \
    tar xzf python1.0.1.tar.gz && \
    cd python-1.0.1 && \
    sed -i 's/\bgetline\b/my_getline/' Objects/fileobject.c && \
    sed -i 's/\bposix_close\b/my_posix_close/' Modules/posixmodule.c && \
    ./configure && \
    make && \
    mv python /bin/python1.0.1 && \
    rm -rf /var/cache/apk/* /tmp/*

COPY script /bin/script

RUN ln -s /bin/script /bin/python1 && \
    chmod 744 /bin -R

WORKDIR /root

CMD [ "script" ]
