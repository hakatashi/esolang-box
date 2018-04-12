FROM esolang/build-base

ENV BUILD_PACKAGES="rsync ncurses" \
    RUNTIME_PACKAGES="libc6-compat" \
    TERM="dumb"

RUN apk add --update $BUILD_PACKAGES $RUNTIME_PACKAGES && \
    cd /tmp && \
    curl -m $TIMEOUT https://github.com/emojicode/emojicode/releases/download/v0.5.4/Emojicode-0.5.4-Linux-x86_64.tar.gz -LO && \
    tar xzf Emojicode-0.5.4-Linux-x86_64.tar.gz  && \
    cd Emojicode-0.5.4-Linux-x86_64 && \
    mkdir -p ~/Emojicode/bin && \
    (yes | ./install.sh ~/Emojicode/bin ~/Emojicode/Emojipackages) && \
    apk del $BUILD_PACKAGES && \
    rm -rf /var/cache/apk/* /tmp/*

ENV EMOJICODE_PACKAGES_PATH /root/Emojicode/Emojipackages

COPY script /bin/script

RUN ln -s /bin/script /bin/emojicode && \
    chmod 744 /bin -R

WORKDIR /root

CMD [ "script" ]
