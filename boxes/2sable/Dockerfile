FROM esolang/python3

RUN git clone --depth 1 https://github.com/Adriandmen/2sable.git ~/2sable

COPY script /bin/script

RUN ln -s /bin/script /bin/2sable && \
    rm /bin/python3 && \
    chmod 744 /bin -R

WORKDIR /root

CMD [ "script" ]
