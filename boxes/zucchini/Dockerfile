FROM esolang/python3

RUN curl -m $TIMEOUT http://pastebin.ca/raw/2313538 -L -o ~/zucchini.py && \
    ln -s /bin/script /bin/zucchini && \
    rm /bin/python3

COPY script /root/script
