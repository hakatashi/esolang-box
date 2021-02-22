FROM esolang/base

RUN cd /tmp && \
    curl https://ziglang.org/download/0.7.1/zig-linux-x86_64-0.7.1.tar.xz > binary.tar.xz && \
    tar xf binary.tar.xz && \
    mv zig-linux-x86_64-0.7.1 ~/ && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/zig

COPY script /root/script
