FROM esolang/build-base

RUN cd /tmp && \
    git clone --depth 1 https://github.com/snuke/a.git && \
    cd a && \
    g++ -O3 -Wall src/combined.cc -o interpreter && \
    mv interpreter ~/interpreter && \
    rm -rf /tmp/* /var/cache/apk/* && \
    ln -s /bin/script /bin/a-language

COPY script /root/script
