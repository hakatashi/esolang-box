FROM esolang/node

RUN git clone --depth 1 https://github.com/ETHproductions/beam-js.git ~/beam-js

COPY beam-cli.js /root/beam-cli.js

COPY script /bin/script

RUN ln -s /bin/script /bin/beam && \
    rm /bin/node && \
    chmod 744 /bin -R
