FROM i386/alpine:3.7
MAINTAINER Koki Takahashi <hakatasiloving@gmail.com>

ENV PATH=/bin:$PATH \
    TIMEOUT=60 \
    BUILD_PACKAGES="build-base curl" \
    RUNTIME_PACKAGES=""

COPY BFI.patch /tmp/BFI.patch

RUN apk update && \
    apk upgrade && \
    apk add $BUILD_PACKAGES $RUNTIME_PACKAGES && \
    cd /tmp && \
    curl -m $TIMEOUT http://esoteric.sange.fi/brainfuck/impl/interp/BFI.c -LO && \
    patch < BFI.patch && \
    gcc BFI.c -fno-stack-protector -mpreferred-stack-boundary=2 -z execstack -o /bin/bfi && \
    apk del $BUILD_PACKAGES && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/brainfuck-bfi

COPY script /root/script
