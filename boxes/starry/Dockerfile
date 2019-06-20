FROM esolang/ruby

RUN curl -m $TIMEOUT https://github.com/yhara/esolang-book-sources/raw/master/starry/starry.rb -L -o ~/starry.rb && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/starry && \
    rm /bin/ruby

COPY script /root/script
COPY disasm /root/disasm
COPY disasm.rb /root/disasm.rb
