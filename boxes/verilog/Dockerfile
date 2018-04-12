FROM esolang/build-base

ENV BUILD_PACKAGES="autoconf gperf" \
    RUNTIME_PACKAGES=""

RUN apk add --update $BUILD_PACKAGES $RUNTIME_PACKAGES && \
    cd /tmp && \
    git clone -b v10_2 --depth 1 https://github.com/steveicarus/iverilog.git && \
    cd iverilog && \
    autoconf && \
    ./configure && \
    (make -j5 > /tmp/make.log) && \
    (make install > /tmp/make-install.log) && \
    apk del $BUILD_PACKAGES && \
    rm -rf /var/cache/apk/* /tmp/*

COPY script /bin/script

RUN ln -s /bin/script /bin/verilog && \
    chmod 744 /bin -R

WORKDIR /root

CMD [ "script" ]
