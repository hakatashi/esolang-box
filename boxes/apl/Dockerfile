FROM esolang/build-base

RUN cd /tmp && \
    curl -m $TIMEOUT http://ftpmirror.gnu.org/gnu/apl/apl-1.7.tar.gz -LO && \
    tar xzf apl-1.7.tar.gz && \
    cd apl-1.7 && \
    ./configure && \
    (make -j5 CXX_WERROR= > /tmp/make.log) && \
    mv src/apl /usr/bin/apl && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/apl

COPY script /root/script
