FROM esolang/befunge98

RUN apk add --update python3 && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/seed && \
    rm /bin/befunge98

COPY script /root/script
COPY seed.py /root/seed.py
