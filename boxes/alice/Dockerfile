FROM esolang/ruby

RUN git clone --depth 1 https://github.com/m-ender/alice.git ~/alice && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/alice && \
    rm /bin/ruby

COPY script /root/script
