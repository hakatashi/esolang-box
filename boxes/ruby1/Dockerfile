FROM esolang/build-base

RUN cd /tmp && \
    git clone --depth 1 https://github.com/rbenv/ruby-build.git && \
    sh -c "PREFIX=/tmp ./ruby-build/install.sh" && \
    /tmp/bin/ruby-build 1.8.7 /usr/local/ruby-1.8.7 && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/ruby1

COPY script /root/script
