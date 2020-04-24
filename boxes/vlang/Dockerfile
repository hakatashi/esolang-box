FROM esolang/build-base

RUN cd /tmp && \
    git clone https://github.com/vlang/v --depth 1 && \
    cd v && \
    make -j5 && \
    mv v ~/v && \
    mv vlib ~/vlib && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/vlang

COPY script /root/script
