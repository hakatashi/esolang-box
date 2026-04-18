FROM esolang/ubuntu-base

ENV BUILD_PACKAGES="rsync" \
    RUNTIME_PACKAGES="bash" \
    TERM="dumb"


RUN apt-get update && \
    apt-get install -y $BUILD_PACKAGES $RUNTIME_PACKAGES && \
    # install libtinfo5 to use libtinfo5.so
    curl -L http://security.ubuntu.com/ubuntu/pool/universe/n/ncurses/libtinfo5_6.3-2ubuntu0.1_amd64.deb -o /tmp/libtinfo5.deb && \
    dpkg -i /tmp/libtinfo5.deb && \
    mkdir -p /usr/local/include/emojicode && \
    cd /tmp/ && curl -LO https://github.com/emojicode/emojicode/releases/download/v1.0-beta.2/Emojicode-1.0-beta.2-Linux-x86_64.tar.gz && \
    tar xzf Emojicode-1.0-beta.2-Linux-x86_64.tar.gz && \
    cd /tmp/Emojicode-1.0-beta.2-Linux-x86_64/ && \
    yes | bash ./install.sh /usr/local/bin /usr/local/EmojicodePackages /usr/local/include/emojicode magicsudod && \
    apt-get purge $BUILD_PACKAGES -y && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/emojicode

COPY script /root/script
