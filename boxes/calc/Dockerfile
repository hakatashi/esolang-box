FROM esolang/node

RUN rm /bin/node && \
    apk add libreoffice npm && \
    npm install csv-parse csv-stringify && \
    apk del npm && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/calc

COPY calc-preprocess.js /root/calc-preprocess.js
COPY calc-postprocess.js /root/calc-postprocess.js

COPY script /root/script
