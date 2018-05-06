FROM esolang/node

RUN rm /bin/node && \
    curl -m $TIMEOUT https://github.com/OinkIguana/htms/raw/master/dist/htms.min.js -L -o ~/htms.min.js && \
    cd ~ && \
    npm install jsdom && \
    rm -rf /var/cache/apk/* /tmp/*

COPY htms-cli.js /root/htms-cli.js

COPY script /bin/script

RUN ln -s /bin/script /bin/htms && \
    chmod 744 /bin -R
