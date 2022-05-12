FROM esolang/ruby

ENV PATH=/usr/local/ruby-latest/bin:$PATH
RUN gem install specific_install && gem specific_install https://github.com/fabon-f/bf-esomer.git master && \
    ln -s /bin/script /bin/brainfuck-esomer

COPY script /root/script
COPY disasm /root/disasm
