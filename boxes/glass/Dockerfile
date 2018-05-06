FROM esolang/build-base

RUN cd /tmp && \
    curl -m 30 http://codu.org/eso/glass/glass-0.12.tar.bz2 -LO && \
    tar xjf glass-0.12.tar.bz2 && \
    cd glass-0.12 && \
    make CXXFLAGS="-O2 -g -include stdio.h -include string.h" && \
    mv glass ~/glass && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/glass

COPY script /bin/script

