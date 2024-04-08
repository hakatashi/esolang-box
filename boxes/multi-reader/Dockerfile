FROM esolang/build-base

RUN cd /tmp && \
    git clone --depth 1 https://github.com/hakatasthi/kusogengo.git -b patch-1 && \
    cd kusogengo && \
    g++ kuso.cpp -o multi-reader && \
    mv multi-reader /usr/bin/multi-reader && \
    rm -rf /tmp/* && \
    ln -s /bin/script /bin/multi-reader

COPY script /root/script