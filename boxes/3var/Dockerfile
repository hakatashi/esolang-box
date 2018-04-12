FROM esolang/build-base

RUN cd /tmp && \
    git clone --depth 1 https://github.com/olls/3var-interpreter.git && \
    cd 3var-interpreter && \
    make && \
    mv 3var ~/3var && \
    rm -rf /var/cache/apk/* /tmp/*

COPY script /bin/script

RUN ln -s /bin/script /bin/3var && \
    chmod 744 /bin -R

WORKDIR /root

CMD [ "script" ]
