FROM esolang/build-base

RUN cd /tmp && \
    git clone --depth 1 https://github.com/kuromunori/kusogengo.git && \
    cd kusogengo && \
    g++ kuso.cpp -o kusogengo && \
    mv kusogengo /usr/bin/kusogengo && \
    rm -rf /tmp/* && \
    ln -s /bin/script /bin/kusogengo

COPY script /root/script