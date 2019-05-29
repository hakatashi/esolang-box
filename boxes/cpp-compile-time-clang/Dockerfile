FROM esolang/cpp-clang

RUN apt-get update -y && \
    apt-get install bsdmainutils -y && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    ln -s /bin/script /bin/cpp-compile-time-clang

COPY script /root/script
