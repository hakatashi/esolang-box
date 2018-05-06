FROM esolang/befunge98

RUN apk add --update python3 && \
    rm -rf /var/cache/apk/* /tmp/*

COPY script /bin/script
COPY seed.py /root/seed.py

RUN ln -s /bin/script /bin/seed && \
    rm /bin/befunge98 && \
    chmod 744 /bin -R
