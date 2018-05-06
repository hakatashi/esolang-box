FROM esolang/python3

RUN mkdir -p ~/hbcht && \
    curl -m $TIMEOUT https://git.metanohi.name/hbcht.git/raw/master/hbcht -L -o ~/hbcht/hbcht && \
    curl -m $TIMEOUT https://git.metanohi.name/hbcht.git/raw/master/hbcht.py -L -o ~/hbcht/hbcht.py

COPY script /bin/script

RUN ln -s /bin/script /bin/hbcht && \
    rm /bin/python3 && \
    chmod 744 /bin -R
