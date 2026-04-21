FROM esolang/python3

RUN mkdir -p ~/foldy && \
    curl -m $TIMEOUT "https://raw.githubusercontent.com/squareroot12621/foldy-language/main/foldy/__init__.py" -L -o ~/foldy/__init__.py && \
    curl -m $TIMEOUT "https://raw.githubusercontent.com/squareroot12621/foldy-language/main/foldy/interpreter.py" -L -o ~/foldy/interpreter.py && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/foldy

COPY script /root/script
