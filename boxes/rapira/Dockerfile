FROM esolang/build-base

RUN git clone https://github.com/freeduke33/rerap2 /tmp/rerap2 --depth 1 && \
    cd /tmp/rerap2 && \
    make -j5 && \
    mv rapira ~/rapira && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/rapira

COPY script /root/script
