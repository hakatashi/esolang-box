FROM esolang/python2

RUN curl -m $TIMEOUT https://github.com/TryItOnline/Bloated-SNUSP/raw/master/snusp.py -LO && \
    ln -s /bin/script /bin/snusp && \
    rm /bin/python2

COPY script /root/script
