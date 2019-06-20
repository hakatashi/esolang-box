FROM esolang/ruby

RUN git clone --depth 1 https://github.com/cookie-s/reversed-c ~/reversed-c && \
    ln -s /bin/script /bin/reversed-c

COPY script /root/script
COPY disasm /root/disasm
