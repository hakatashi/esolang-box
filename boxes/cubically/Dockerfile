FROM esolang/build-base

RUN cd /tmp && \
    git clone --depth 1 -b v4.0-beta https://github.com/aaronryank/Cubically.git && \
    cd Cubically && \
    make && \
    mv cubically /usr/bin/cubically && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/cubically

COPY script /bin/script

