FROM esolang/build-base

RUN apk add --update python2 --repository http://dl-cdn.alpinelinux.org/alpine/v3.15/community && \
    git clone --depth 1 https://github.com/lifthrasiir/esotope-bfc.git ~/esotope-bfc && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/brainfuck-esotope

COPY script /root/script
COPY disasm /root/disasm
