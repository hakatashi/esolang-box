FROM esolang/ubuntu-base

RUN apt-get update && \
    apt-get install -y apache2 python3 python3-pip && \
    apt-get autoremove -y && \
    apt-get clean && \
    pip3 install requests && \
    rm -rf /var/lib/apt/lists/* /tmp/* && \
    mkdir /etc/apache2/logs && \
    ln -s /bin/script /bin/apache2-rewrite

COPY apache2-rewrite.py /root/apache2-rewrite.py
COPY script /root/script
