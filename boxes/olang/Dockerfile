FROM esolang/build-base

RUN cd /tmp && \
    git clone --recursive --depth 1 https://github.com/phase/o.git && \
    cd o && \
    make all && \
    mv o /root/o && \
    ln -s /bin/script /bin/olang && \
    rm -rf /tmp

COPY script /bin/script
