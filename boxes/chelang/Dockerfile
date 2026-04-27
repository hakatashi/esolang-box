FROM esolang/python3

RUN apk add --update git && \
    cd /tmp && \
    git clone --depth 1 --branch v1.2.0 https://github.com/francodilu/CheLang.git chelang && \
    mv chelang/CheLang ~/CheLang && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/chelang

COPY run_chelang.py /root/run_chelang.py
COPY script /root/script
