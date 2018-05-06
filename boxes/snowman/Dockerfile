FROM esolang/build-base

RUN cd /tmp && \
    git clone --depth 1 https://github.com/KeyboardFire/snowman-lang.git snowman && \
    cd snowman/lib && \
    make && \
    mv snowman /usr/bin/snowman && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/snowman

COPY script /bin/script

