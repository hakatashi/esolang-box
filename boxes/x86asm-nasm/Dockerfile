FROM esolang/ubuntu-base

ENV RUNTIME_PACKAGES="nasm gcc-multilib"

RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install $RUNTIME_PACKAGES -y && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* && \
    ln -s /bin/script /bin/x86asm-nasm

COPY script /root/script
COPY gcc.spec /root/gcc.spec
