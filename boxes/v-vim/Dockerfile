FROM esolang/vim

RUN rm /bin/vim /root/disasm && \
    apk add bash coreutils && \
    git clone --depth 1 https://github.com/DJMcMayhem/V.git ~/V && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/v-vim

COPY script /root/script
