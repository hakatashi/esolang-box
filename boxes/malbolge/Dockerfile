FROM esolang/build-base

RUN cd /tmp && \
    curl -m $TIMEOUT http://esoteric.sange.fi/orphaned/malbolge/malbolge.c -LO && \
    gcc -O2 -Wall malbolge.c -o malbolge && \
    mv malbolge ~/malbolge && \
    rm -rf /var/cache/apk/* /tmp/*

COPY script /bin/script

RUN ln -s /bin/script /bin/malbolge && \
    chmod 744 /bin -R

WORKDIR /root

CMD [ "script" ]
