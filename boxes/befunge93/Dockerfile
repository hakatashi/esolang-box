FROM esolang/build-base

RUN cd /tmp && \
    curl -m $TIMEOUT http://catseye.tc/distfiles/befunge-93-2.23-2015.0101.zip -LO && \
    unzip befunge-93-2.23-2015.0101.zip && \
    cd befunge-93-2.23-2015.0101 && \
    make && \
    mv bin/bef ~/bef && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/befunge93

COPY script /bin/script

