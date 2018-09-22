FROM esolang/build-base

RUN cd /tmp && \
    git clone --depth 1 https://github.com/Tiramister/codemania.git && \
    cd codemania && \
    g++ -o /usr/bin/codemania codemania.cpp && \
    rm -rf /tmp/* && \
    ln -s /bin/script /bin/codemania

COPY script /root/script
