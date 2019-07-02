FROM esolang/ruby

RUN apk add --update vim && \
    curl -L https://github.com/igrigorik/vimgolf/raw/master/lib/vimgolf/lib/vimgolf/keylog.rb -o /root/keylog.rb && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/vim

COPY script /root/script
COPY disasm /root/disasm
