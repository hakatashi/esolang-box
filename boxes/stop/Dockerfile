FROM esolang/node

RUN rm /bin/node && \
    git clone --depth 1 https://github.com/colinjeanne/stop-lang.git ~/stop-lang && \
    cd ~/stop-lang && \
    npm install && \
    npm run build:umd && \
    rm -rf node_modules /var/cache/apk/* /tmp/*

COPY stop-cli.js /root/stop-cli.js

COPY script /bin/script

RUN ln -s /bin/script /bin/stop && \
    chmod 744 /bin -R
