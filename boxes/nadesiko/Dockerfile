FROM esolang/node

RUN rm /bin/node && \
    (npm install -g nadesiko3 || echo "npm install aborted") && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/nadesiko

COPY script /bin/script

