FROM esolang/build-base

RUN cd /tmp && \
    curl -m $TIMEOUT https://gist.github.com/threeifbywhiskey/0e98d42150eb644a3406/raw/59226c87e70469f691522f67161be22f23e37904/braille.c -LO && \
    gcc -O2 -Wall -o braille braille.c && \
    mv braille /usr/bin/braille && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/braille

COPY script /bin/script

