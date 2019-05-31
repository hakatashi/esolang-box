FROM esolang/node

RUN curl -m $TIMEOUT https://github.com/hoge-fuga-0000/Nuts/raw/master/nuts.js -L -o ~/nuts.js && \
    echo 'module.exports = createRuntime;' >> ~/nuts.js && \
    ln -s /bin/script /bin/nuts && \
    rm /bin/node

COPY nuts-cli.js /root/nuts-cli.js

COPY script /root/script
