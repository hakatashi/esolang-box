FROM esolang/build-base

ENV BUILD_PACKAGES="recode" \
    RUNTIME_PACKAGES=""

RUN apk add $BUILD_PACKAGES $RUNTIME_PACKAGES && \
    cd /tmp && \
    curl -m $TIMEOUT "https://esolangs.org/wiki/User:Marinus/Word%21CPU_interpreter" -L | awk -F "</?pre>" '{print $2}' RS="b\bb" | recode HTML..u8 | tr -cd '\0-\200' > wordcpu.c && \
    gcc -Wall -O2 wordcpu.c -o wordcpu && \
    mv wordcpu /usr/bin/wordcpu && \
    apk del $BUILD_PACKAGES && \
    rm -rf /var/cache/apk/* /tmp/*

COPY script /bin/script

RUN ln -s /bin/script /bin/wordcpu && \
    chmod 744 /bin -R
