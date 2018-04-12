FROM esolang/build-base

RUN cd /tmp && \
    curl -m $TIMEOUT http://www.golfscript.com/minus/files/iminus.c -LO && \
    gcc -Wall -O2 iminus.c -o /usr/bin/iminus && \
    rm -rf /var/cache/apk/* /tmp/*

COPY script /bin/script

RUN ln -s /bin/script /bin/minus && \
    chmod 744 /bin -R

WORKDIR /root

CMD [ "script" ]
