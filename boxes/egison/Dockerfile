FROM esolang/ubuntu-base

RUN apt-get install wget -y && \
    wget https://git.io/egison.x86_64.deb && \
    dpkg -i ./egison.x86_64.deb && \
    rm ./egison.x86_64.deb && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    ln -s /bin/script /bin/egison

COPY script /root/script
