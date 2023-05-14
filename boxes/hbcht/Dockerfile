FROM esolang/python3

RUN mkdir -p ~/hbcht && \
    curl -m $TIMEOUT https://raw.githubusercontent.com/nqpz/hbcht/master/hbcht -L -o ~/hbcht/hbcht && \
    curl -m $TIMEOUT https://raw.githubusercontent.com/nqpz/hbcht/master/hbcht.py -L -o ~/hbcht/hbcht.py && \
    sed -i 's/collections.Iterable/collections.abc.Iterable/g' ~/hbcht/hbcht ~/hbcht/hbcht.py && \
    ln -s /bin/script /bin/hbcht && \
    rm /bin/python3

COPY script /root/script
