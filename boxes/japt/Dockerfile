FROM esolang/node

RUN git clone --depth 1 https://github.com/ETHproductions/japt.git ~/japt

COPY japt-cli.js /root/japt-cli.js

COPY script /bin/script

RUN ln -s /bin/script /bin/japt && \
    rm /bin/node && \
    chmod 744 /bin -R

WORKDIR /root

CMD [ "script" ]
