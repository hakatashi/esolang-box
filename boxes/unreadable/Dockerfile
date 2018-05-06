FROM esolang/python2

COPY unreadable.py /root/unreadable.py
COPY script /bin/script

RUN ln -s /bin/script /bin/unreadable && \
    rm /bin/python2 && \
    chmod 744 /bin -R
