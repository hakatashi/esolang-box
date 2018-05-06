FROM esolang/python2

RUN git clone --depth 1 https://github.com/CodeAbbey/intel4004-emu.git ~/intel4004-emu && \
    ln -s /bin/script /bin/i4004asm && \
    rm /bin/python2

COPY script /bin/script

