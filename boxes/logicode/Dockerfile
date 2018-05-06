FROM esolang/python2

RUN git clone --depth 1 https://github.com/LogicodeLang/Logicode.git ~/Logicode && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/logicode && \
    rm /bin/python2

COPY script /root/script
