FROM esolang/build-base

ENV BUILD_PACKAGES="cmake" \
    RUNTIME_PACKAGES=""

RUN apk add --update $BUILD_PACKAGES $RUNTIME_PACKAGES && \
    cd /tmp && \
    git clone --depth 1 https://github.com/justinmeza/lci.git && \
    cd lci && \
    cmake . && \
    make && \
    mv lci /usr/bin/lci && \
    apk del $BUILD_PACKAGES && \
    rm -rf /var/cache/apk/* /tmp/*

COPY script /bin/script

RUN ln -s /bin/script /bin/lolcode && \
    chmod 744 /bin -R

WORKDIR /root

CMD [ "script" ]
