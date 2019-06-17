FROM esolang/cpp-clang

COPY hex.c /tmp/hex.c
RUN apt-get update -y && \
    apt-get install bsdmainutils -y && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    gcc /tmp/hex.c -o /bin/hex && \
    rm /tmp/hex.c && \
    ln -s /bin/script /bin/cpp-compile-time-clang

COPY script /root/script
