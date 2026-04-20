FROM esolang/ubuntu-base

RUN cd /tmp && \
    curl -sL http://downloads.factorcode.org/releases/0.100/factor-linux-x86-64-0.100.tar.gz -o factor.tar.gz && \
    tar -C /opt -xzf factor.tar.gz && \
    rm -f /tmp/factor.tar.gz && \
    ln -sf /bin/script /bin/factor

COPY script /root/script
