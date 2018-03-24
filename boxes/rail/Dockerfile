FROM esolang/build-base

RUN cd /tmp && \
    curl -m $TIMEOUT https://github.com/graue/esofiles/raw/master/rail/impl/rail-0.5.tar.gz -LO && \
    tar xzf rail-0.5.tar.gz && \
    cd rail-0.5 && \
    sh compile.sh && \
    mv rail /usr/bin/rail && \
    rm -rf /var/cache/apk/* /tmp/*

COPY script /bin/script

RUN ln -s /bin/script /bin/rail && \
    chmod 744 /bin -R

WORKDIR /root

CMD [ "script" ]
