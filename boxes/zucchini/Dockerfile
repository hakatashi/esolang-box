FROM esolang/python3

RUN curl -m $TIMEOUT http://pastebin.ca/raw/2313538 -L -o ~/zucchini.py

COPY script /bin/script

RUN ln -s /bin/script /bin/zucchini && \
    rm /bin/python3 && \
    chmod 744 /bin -R

WORKDIR /root

CMD [ "script" ]
