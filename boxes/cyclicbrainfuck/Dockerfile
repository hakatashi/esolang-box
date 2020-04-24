FROM esolang/build-base

RUN cd /tmp && \
    git clone --recursive --depth 1 https://github.com/hiromi-mi/cyclicbrainfuck && \
    cd cyclicbrainfuck && \
    make && \
    cp cyclicbrainfuck /bin/cyclicbrainfuck

COPY script /bin/script
