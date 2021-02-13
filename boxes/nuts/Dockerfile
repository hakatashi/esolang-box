FROM esolang/node

RUN ln -s /bin/script /bin/nuts && \
    rm /bin/node

COPY nuts.js /root/nuts.js
COPY nuts-cli.js /root/nuts-cli.js

COPY script /root/script
