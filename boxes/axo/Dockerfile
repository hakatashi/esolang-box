FROM esolang/build-base

RUN cd /tmp && \
    curl -m 30 "http://web.archive.org/web/20070423184121/http://www.harderweb.de/jix/langs/axo/axopp.0.1.0.cc" -LO && \
    sed -i 's/sranddev()/srand(time(NULL))/' axopp.0.1.0.cc && \
    g++ -O2 -Wall axopp.0.1.0.cc -o axopp -include stdlib.h && \
    mv axopp ~/axopp && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/axo

COPY script /bin/script

