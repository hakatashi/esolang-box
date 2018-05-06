FROM esolang/python3

RUN git clone --depth 1 https://github.com/samshadwell/TrumpScript.git ~/TrumpScript && \
    ln -s /bin/script /bin/trumpscript && \
    rm /bin/python3

COPY script /root/script
