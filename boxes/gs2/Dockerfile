FROM esolang/python2

RUN curl -m $TIMEOUT https://github.com/nooodl/gs2/raw/master/gs2.py -L -o ~/gs2.py && \
    rm -rf /var/cache/apk/* /tmp/*

COPY script /bin/script

RUN ln -s /bin/script /bin/gs2 && \
    rm /bin/python2 && \
    chmod 744 /bin -R
