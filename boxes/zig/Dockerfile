FROM esolang/base

RUN cd /tmp && \
    curl -O https://ziglang.org/download/0.16.0/zig-x86_64-linux-0.16.0.tar.xz && \
    tar xf zig-x86_64-linux-0.16.0.tar.xz && \
    mv zig-x86_64-linux-0.16.0 ~/ && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/zig

COPY script /root/script
