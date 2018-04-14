FROM esolang/build-base

RUN cd /tmp && \
    git clone --depth 1 -b v4.0-beta https://github.com/aaronryank/Cubically.git && \
    cd Cubically && \
    make && \
    mv cubically /usr/bin/cubically && \
    rm -rf /var/cache/apk/* /tmp/*

COPY script /bin/script

RUN ln -s /bin/script /bin/cubically && \
    chmod 744 /bin -R

WORKDIR /root

CMD [ "script" ]
