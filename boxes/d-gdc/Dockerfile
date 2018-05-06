FROM esolang/ubuntu-base

RUN apt-get update && \
    apt-get install gdc -y && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    ln -s /bin/script /bin/d-gdc

COPY script /bin/script

