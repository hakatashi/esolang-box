FROM esolang/node

RUN git clone --depth 1 https://github.com/ETHproductions/japt.git ~/japt && \
    ln -s /bin/script /bin/japt && \
    rm /bin/node

COPY japt-cli.js /root/japt-cli.js

COPY script /root/script
