FROM esolang/ubuntu-base

ENV BUILD_PACKAGES="git automake autoconf libcurl4-openssl-dev zlib1g-dev" \
    RUNTIME_PACKAGES=""

RUN apt-get update && \
    apt-get install $RUNTIME_PACKAGES $BUILD_PACKAGES -y && \
    cd /tmp && \
    git clone --depth=1 -b release https://github.com/roswell/roswell.git && \
    cd roswell && \
    sh bootstrap && \
    ./configure --disable-manual-install && \
    make && \
    make install && \
    ros run -q && \
    apt-get purge $BUILD_PACKAGES -y && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* && \
    ln -s /bin/script /bin/clisp-sbcl

COPY script /root/script
