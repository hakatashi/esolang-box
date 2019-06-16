FROM esolang/base

RUN apk add --update qemu-riscv32 && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/riscv

COPY script /root/script
