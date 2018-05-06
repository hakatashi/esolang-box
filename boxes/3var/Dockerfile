FROM esolang/build-base

RUN cd /tmp && \
    git clone --depth 1 https://github.com/olls/3var-interpreter.git && \
    cd 3var-interpreter && \
    make && \
    mv 3var ~/3var && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/3var

COPY script /root/script
