FROM esolang/ruby

RUN git clone --depth 1 https://github.com/n4o847/tsg-2018-summer.git ~/copos-rb && \
    sed "s/eval/puts/" ~/copos-rb/copos.rb > ~/copos-rb/disasm.rb && \
    ln -s /bin/script /bin/copos-rb

COPY script /root/script
COPY disasm /root/disasm
