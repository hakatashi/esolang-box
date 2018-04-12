FROM esolang/node

RUN git clone --depth 1 https://github.com/ETHproductions/cubix.git ~/cubix

COPY cubix-cli.js /root/cubix-cli.js

COPY script /bin/script

RUN ln -s /bin/script /bin/cubix && \
    rm /bin/node && \
    chmod 744 /bin -R

WORKDIR /root

CMD [ "script" ]
