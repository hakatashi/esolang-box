FROM esolang/python3

RUN git clone --depth 1 https://github.com/hiromi-mi/ubergenes-impl/ && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/ubergenes && \
    rm /bin/python3

COPY script /root/script
