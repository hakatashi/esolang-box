FROM esolang/build-base

RUN cd /tmp && \
    git clone --recursive --depth 1 https://github.com/hiromi-mi/cyclicbrainfuck && \
    cd cyclicbrainfuck && \
    make && \
    mv cyclicbrainfuck /root/cyclicbrainfuck && \
    ln -s /bin/script /bin/cyclicbrainfuck && \
    rm -rf /tmp

COPY script /bin/script
