FROM esolang/base

RUN cd /tmp && \
    curl -m 300 https://zen-lang.org/dist/0.8.20191124/zen-linux-x86_64-0.8.20191124+552247019.tar.xz -LO && \
    tar xf "zen-linux-x86_64-0.8.20191124+552247019.tar.xz" -C ~ && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/zen

COPY script /root/script
