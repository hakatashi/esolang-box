FROM esolang/node

RUN rm /bin/node && \
    apk add libreoffice npm && \
    npm install csv-parse csv-stringify && \
    apk del npm && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/calc

COPY calc-preprocess.mjs /root/calc-preprocess.mjs
COPY calc-postprocess.mjs /root/calc-postprocess.mjs

COPY script /root/script
