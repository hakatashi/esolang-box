FROM esolang/python2

RUN curl -m $TIMEOUT https://www.csh.rit.edu/~pat/hack/quickies/recurse/recurse.py -L -o ~/recurse.py && \
    rm -rf /var/cache/apk/* /tmp/*

COPY script /bin/script

RUN ln -s /bin/script /bin/recurse && \
    rm /bin/python2 && \
    chmod 744 /bin -R

WORKDIR /root

CMD [ "script" ]
