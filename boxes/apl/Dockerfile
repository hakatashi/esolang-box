FROM esolang/build-base

ENV VERSION="1.8"

RUN cd /tmp && \
    curl -m $TIMEOUT https://ftpmirror.gnu.org/gnu/apl/apl-${VERSION}.tar.gz -LO && \
    tar xzf apl-${VERSION}.tar.gz && \
    cd apl-${VERSION} && \
    ./configure && \
    (make -j5 CXX_WERROR= > /tmp/make.log) && \
    mv src/apl /usr/bin/apl && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/apl

COPY script /root/script
