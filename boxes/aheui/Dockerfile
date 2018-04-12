FROM esolang/build-base

RUN cd /tmp && \
    git clone --depth 1 https://github.com/aheui/caheui.git && \
    cd caheui && \
    make && \
    mv aheui /usr/bin/aheui && \
    rm -rf /var/cache/apk/* /tmp/*

COPY script /bin/script

RUN ln -s /bin/script /bin/aheui && \
    chmod 744 /bin -R

WORKDIR /root

CMD [ "script" ]
