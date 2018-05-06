FROM esolang/python3

RUN git clone --depth 1 https://github.com/Adriandmen/2sable.git ~/2sable && \
    ln -s /bin/script /bin/2sable && \
    rm /bin/python3

COPY script /bin/script

