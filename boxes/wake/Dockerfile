FROM esolang/ruby

RUN cd /tmp && \
    curl -m $TIMEOUT http://shinh.skr.jp/wake/wake.tgz -LO && \
    tar xzf wake.tgz && \
    mv wake/waker.rb /root/waker.rb && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/wake

COPY script /root/script
