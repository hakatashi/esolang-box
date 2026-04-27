FROM esolang/build-base

ENV BUILD_PACKAGES="wget gpm-dev libxext-dev libxpm-dev libxrandr-dev mesa-dev libffi-dev gmp-dev gsl-dev tre-dev glib-dev pcre2-dev" \
    RUNTIME_PACKAGES="gcompat ncurses-dev"

RUN echo "https://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    apk add --update $BUILD_PACKAGES $RUNTIME_PACKAGES && \
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
    apk del $BUILD_PACKAGES && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/basic-freebasic

COPY script /root/script
