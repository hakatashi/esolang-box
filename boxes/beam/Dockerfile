FROM esolang/node

RUN git clone --depth 1 https://github.com/ETHproductions/beam-js.git ~/beam-js && \
    ln -s /bin/script /bin/beam && \
    rm /bin/node

COPY beam-cli.js /root/beam-cli.js

COPY script /bin/script

