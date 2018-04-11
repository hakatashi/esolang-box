FROM esolang/python3

RUN git clone --depth 1 https://github.com/iatorm/jellyfish.git ~/jellyfish

COPY script /bin/script

RUN ln -s /bin/script /bin/jellyfish && \
    rm /bin/python3 && \
    chmod 744 /bin -R

WORKDIR /root

CMD [ "script" ]
