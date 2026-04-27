FROM esolang/build-base

ENV BUILD_PACKAGES="cmake" \
    RUNTIME_PACKAGES=""

RUN apk add --update $BUILD_PACKAGES $RUNTIME_PACKAGES && \
    cd /tmp && \
    git clone --depth 1 https://github.com/VorpalBlade/cfunge.git -b 1,001 && \
    cd cfunge && \
    mkdir build && \
    cd build && \
    cmake .. -DCMAKE_C_FLAGS="-fpermissive" && \
    cmake --build . -j$(nproc) && \
    mv cfunge ~/cfunge && \
    apk del $BUILD_PACKAGES && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/befunge98

COPY script /root/script
