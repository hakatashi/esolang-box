FROM esolang/ubuntu-base

ENV DEBIAN_FRONTEND=noninteractive

COPY rmsil.c /tmp/rmsil.c

RUN apt-get update && \
    apt-get install -y build-essential csound && \
    gcc -o ~/rmsil /tmp/rmsil.c
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* && \
    ln -s /bin/script /bin/csound

COPY script /root/script

RUN chmod +x /root/script
