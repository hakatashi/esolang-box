FROM esolang/python2

RUN curl -m $TIMEOUT https://github.com/graue/esofiles/raw/master/zombie/impl/zombie.py -L -o ~/zombie.py

COPY script /bin/script

RUN ln -s /bin/script /bin/zombie && \
    chmod 744 /bin -R
