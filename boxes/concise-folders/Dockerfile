FROM esolang/pure-folders

COPY script /bin/script

RUN ln -s /bin/script /bin/concise-folders && \
    rm /bin/pure-folders && \
    chmod 744 /bin -R
