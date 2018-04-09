FROM esolang/build-base

RUN cd /tmp && \
    curl https://github.com/hostilefork/whitespacers/raw/master/c/whitespace.c -LO && \
    gcc -Wall -O2 whitespace.c -o whitespace && \
    mv whitespace /usr/bin/whitespace && \
    rm -rf /var/cache/apk/* /tmp/*

COPY script /bin/script

RUN ln -s /bin/script /bin/whitespace && \
    chmod 744 /bin -R

WORKDIR /root

CMD [ "script" ]
