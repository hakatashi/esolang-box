FROM esolang/build-base

RUN cd /tmp && \
    git clone --depth 1 https://github.com/matz/streem.git && \
    cd streem && \
    make CDEFS="-DNO_QSORT_R -DNO_LOCKFREE_QUEUE" && \
    mv bin/streem /usr/bin/streem && \
    rm -rf /var/cache/apk/* /tmp/*

COPY script /bin/script

RUN ln -s /bin/script /bin/streem && \
    chmod 744 /bin -R

WORKDIR /root

CMD [ "script" ]
