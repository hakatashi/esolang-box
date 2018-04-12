FROM esolang/python3

RUN git clone --depth 1 https://github.com/samshadwell/TrumpScript.git ~/TrumpScript

COPY script /bin/script

RUN ln -s /bin/script /bin/trumpscript && \
    rm /bin/python3 && \
    chmod 744 /bin -R

WORKDIR /root

CMD [ "script" ]
