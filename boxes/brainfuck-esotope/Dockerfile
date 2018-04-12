FROM esolang/build-base

ENV BUILD_PACKAGES="" \
    RUNTIME_PACKAGES="python2"

RUN apk add --update $BUILD_PACKAGES $RUNTIME_PACKAGES && \
    git clone --depth 1 https://github.com/lifthrasiir/esotope-bfc.git ~/esotope-bfc && \
    apk del $BUILD_PACKAGES && \
    rm -rf /var/cache/apk/* /tmp/*

COPY script /bin/script

RUN ln -s /bin/script /bin/brainfuck-esotope && \
    chmod 744 /bin -R

WORKDIR /root

CMD [ "script" ]
