FROM esolang/vim

RUN rm /bin/vim /root/disasm && \
    apk add bash && \
    git clone --depth 1 https://github.com/christianrondeau/autovim.git ~/autovim && \
    sed -i 's/while read input/while IFS= read -r input || [ -n "\$input" ]/' autovim/bin/autovim && \
    sed -i 's/eval "\$VimLaunch"/eval "\$VimLaunch" >\&2/' autovim/bin/autovim && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/autovim

COPY script /root/script
