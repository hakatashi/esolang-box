FROM esolang/node

RUN git clone --depth 1 https://github.com/ETHproductions/cubix.git ~/cubix && \
    ln -s /bin/script /bin/cubix && \
    rm /bin/node

COPY cubix-cli.js /root/cubix-cli.js

COPY script /bin/script

