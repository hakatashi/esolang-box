FROM esolang/ubuntu-base

RUN apt-get update && \
    apt-get install gdc -y && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY script /bin/script

RUN ln -s /bin/script /bin/d-gdc && \
    chmod 744 /bin -R

WORKDIR /root

CMD [ "script" ]
