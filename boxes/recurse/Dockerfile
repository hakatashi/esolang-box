FROM esolang/python2

RUN curl -m $TIMEOUT https://www.csh.rit.edu/~pat/hack/quickies/recurse/recurse.py -L -o ~/recurse.py && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/recurse && \
    rm /bin/python2

COPY script /bin/script

