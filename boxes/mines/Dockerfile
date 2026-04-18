FROM esolang/python3

RUN apk add --update py3-pip && \
    git clone --depth 1 https://github.com/dnek/mines-esolang.git ~/mines && \
    pip install --break-system-packages --ignore-requires-python ~/mines && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/mines

COPY script /root/script
