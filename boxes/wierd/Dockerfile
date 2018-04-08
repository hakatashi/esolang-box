FROM esolang/build-base

RUN cd /tmp && \
    git clone --depth 1 https://github.com/catseye/Wierd.git Wierd && \
    cd Wierd/dialect/wierd-jnc && \
    make && \
    cp bin/wierd-jnc /usr/bin/wierd-jnc && \
    rm -rf /var/cache/apk/* /tmp/*

COPY script /bin/script

RUN ln -s /bin/script /bin/wierd && \
    chmod 744 /bin -R

WORKDIR /root

CMD [ "script" ]
