FROM esolang/build-base

RUN cd /tmp && \
    git clone --depth 1 https://github.com/rbenv/ruby-build.git && \
    sh -c "PREFIX=/tmp ./ruby-build/install.sh" && \
    /tmp/bin/ruby-build 1.8.7 /usr/local/ruby-1.8.7 && \
    rm -rf /var/cache/apk/* /tmp/*

COPY script /bin/script

RUN ln -s /bin/script /bin/ruby1 && \
    chmod 744 /bin -R

WORKDIR /root

CMD [ "script" ]
