FROM esolang/build-base

RUN cd /tmp && \
    git clone --depth 1 https://github.com/KeyboardFire/snowman-lang.git snowman && \
    cd snowman/lib && \
    make && \
    mv snowman /usr/bin/snowman && \
    rm -rf /var/cache/apk/* /tmp/*

COPY script /bin/script

RUN ln -s /bin/script /bin/snowman && \
    chmod 744 /bin -R

WORKDIR /root

CMD [ "script" ]
