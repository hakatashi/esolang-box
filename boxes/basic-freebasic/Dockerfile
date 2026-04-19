FROM esolang/ubuntu-base

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y wget libgpm-dev libxext-dev libxpm-dev libxrandr-dev libgl1-mesa-dev libffi-dev libncurses-dev libgmp-dev libgsl-dev libtre-dev libglib2.0-dev libpcre2-dev && \
    cd /tmp && \
    wget -O bootstrap.tar.xz https://github.com/freebasic/fbc/releases/download/1.10.1/FreeBASIC-1.10.1-source-bootstrap.tar.xz && \
    mkdir bootstrap && \
    tar --strip-components=1 -C bootstrap -xf bootstrap.tar.xz && \
    cd /tmp/bootstrap && \
    make -j$(nproc) bootstrap-minimal && \
    cd /tmp && \
    wget https://github.com/freebasic/fbc/archive/refs/tags/1.10.1.tar.gz && \
    tar xf 1.10.1.tar.gz && \
    cd fbc-1.10.1 && \
    make -j$(nproc) FBC='/tmp/bootstrap/bin/fbc -i /tmp/bootstrap/inc' && \
    make install && \
    rm -rf /tmp/* && \
    ln -s /bin/script /bin/basic-freebasic

COPY script /root/script
