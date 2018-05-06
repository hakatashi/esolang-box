FROM esolang/node

RUN rm /bin/node && \
    (npm install -g nadesiko3 || echo "npm install aborted") && \
    rm -rf /var/cache/apk/* /tmp/*

COPY script /bin/script

RUN ln -s /bin/script /bin/nadesiko && \
    chmod 744 /bin -R
