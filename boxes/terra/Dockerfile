FROM esolang/ubuntu-base

RUN cd /tmp && \
    curl -L https://github.com/terralang/terra/releases/download/release-1.2.0/terra-Linux-x86_64-cc543db.tar.xz -o terra.tar.xz && \
    tar xf terra.tar.xz && \
    mv terra-Linux-x86_64-cc543db /root/terra && \
    rm -rf /tmp/* && \
    ln -s /bin/script /bin/terra

COPY script /root/script
