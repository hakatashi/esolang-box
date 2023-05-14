FROM esolang/build-base

ENV VFLAGS -cc gcc

RUN apk add --update git make upx openssl-dev sqlite-dev gc-dev && \
    cd /tmp && \
    git clone https://github.com/vlang/v && \
    cd /tmp/v && \
    make && \
    mv v ~/v && \
    mv vlib ~/vlib && \
    mkdir -p /root/thirdparty/tcc/lib && \
    cp thirdparty/tcc/lib/libgc.a /root/thirdparty/tcc/lib/ && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/vlang

COPY script /root/script
