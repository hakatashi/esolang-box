FROM esolang/ubuntu-base

RUN cd /tmp && \
    curl -L https://github.com/maurymarkowitz/RetroBASIC/releases/download/v.3.0.2/retrobasic-linux-x86_64.zip -o retrobasic.zip && \
    unzip retrobasic.zip && \
    mv retrobasic-linux-x86_64/bin/retrobasic /usr/local/bin/ && \
    rm -rf /tmp/* && \
    ln -s /bin/script /bin/basic-retrobasic

COPY script /root/script
