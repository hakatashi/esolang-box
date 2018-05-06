FROM esolang/python2

RUN curl -m $TIMEOUT https://github.com/graue/esofiles/raw/master/zombie/impl/zombie.py -L -o ~/zombie.py && \
    ln -s /bin/script /bin/zombie

COPY script /bin/script

