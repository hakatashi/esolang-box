FROM esolang/build-base

RUN cd /tmp && \
    curl -m 30 https://ftp.gnu.org/gnu/cim/cim-5.1.tar.gz -LO && \
    tar xzf cim-5.1.tar.gz && \
    cd cim-5.1 && \
    sed -i 's:\.\./\.\./lib/:../lib/:' lib/* && \
    (./configure > /tmp/configure.log) && \
    (make -j5 > /tmp/make.log) && \
    make install && \
    rm -rf /var/cache/apk/* /tmp/*

COPY script /bin/script

RUN ln -s /bin/script /bin/simula && \
    chmod 744 /bin -R
