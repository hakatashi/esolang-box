FROM esolang/ruby

RUN git clone --depth 1 https://github.com/nefo-mi/Typhon.git ~/Typhon && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/typhon && \
    rm /bin/ruby

COPY script /bin/script

