FROM esolang/build-base

RUN cd /tmp && \
    git clone --depth 1 https://github.com/aheui/caheui.git && \
    cd caheui && \
    make && \
    mv aheui /usr/bin/aheui && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/aheui

COPY script /bin/script

