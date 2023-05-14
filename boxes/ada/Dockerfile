FROM esolang/ubuntu-base

RUN apt-get update && \
    apt-get -y install gnat && \
    rm -rf /var/lib/apt/lists/* && \
    ln -s /bin/script /bin/ada

COPY script /root/script
