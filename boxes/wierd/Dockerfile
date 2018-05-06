FROM esolang/build-base

RUN cd /tmp && \
    git clone --depth 1 https://github.com/catseye/Wierd.git Wierd && \
    cd Wierd/dialect/wierd-jnc && \
    make && \
    cp bin/wierd-jnc /usr/bin/wierd-jnc && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/wierd

COPY script /bin/script

