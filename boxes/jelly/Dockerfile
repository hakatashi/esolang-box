FROM esolang/python3

ENV LC_ALL en_US.UTF-8

RUN git clone --depth 1 https://github.com/DennisMitchell/jelly.git ~/jelly

COPY script /bin/script

RUN ln -s /bin/script /bin/jelly && \
    rm /bin/python3 && \
    chmod 744 /bin -R

WORKDIR /root

CMD [ "script" ]
