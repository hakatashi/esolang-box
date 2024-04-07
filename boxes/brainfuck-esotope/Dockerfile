FROM esolang/python2

RUN git clone --depth 1 https://github.com/lifthrasiir/esotope-bfc.git ~/esotope-bfc && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/brainfuck-esotope && \
    rm /bin/python2

COPY script /root/script
COPY disasm /root/disasm
