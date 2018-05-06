FROM esolang/build-base

RUN cd /tmp && \
    git clone --depth 1 https://github.com/matz/streem.git && \
    cd streem && \
    make CDEFS="-DNO_QSORT_R -DNO_LOCKFREE_QUEUE" && \
    mv bin/streem /usr/bin/streem && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/streem

COPY script /root/script
