FROM esolang/python2

RUN ln -s /bin/script /bin/unreadable && \
    rm /bin/python2

COPY unreadable.py /root/unreadable.py
COPY script /root/script
COPY disasm /root/disasm
