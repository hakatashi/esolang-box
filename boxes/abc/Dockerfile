FROM esolang/ubuntu-base

ENV BUILD_PACKAGES="" \
    RUNTIME_PACKAGES="libc6:i386 libncurses5:i386 libstdc++6:i386"

RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install $RUNTIME_PACKAGES $BUILD_PACKAGES -y && \
    cd /tmp && \
    curl -m $TIMEOUT https://homepages.cwi.nl/~steven/abc/implementations/abc.tar.gz -LO && \
    tar xf abc.tar.gz -C ~ && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* && \
    ln -s /bin/script /bin/abc

COPY script /root/script
