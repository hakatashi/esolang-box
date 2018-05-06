FROM esolang/ruby

RUN git clone --depth 1 https://github.com/m-ender/labyrinth.git ~/labyrinth && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/labyrinth && \
    rm /bin/ruby

COPY script /root/script
