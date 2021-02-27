FROM esolang/ubuntu-base
RUN apt-get update && apt-get install -y nim
RUN curl https://nim-lang.org/choosenim/init.sh -sSf > init.sh && \
    sed -i -e 's/need_tty=yes/need_tty=no/' init.sh && \
    sh init.sh
RUN ln -s /bin/script /bin/nim-lang
COPY script /root/script
