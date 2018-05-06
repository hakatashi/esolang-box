FROM esolang/python3

RUN git clone --depth 1 https://github.com/Adriandmen/05AB1E.git ~/05AB1E

COPY script /bin/script

RUN ln -s /bin/script /bin/05ab1e && \
    chmod 744 /bin -R
