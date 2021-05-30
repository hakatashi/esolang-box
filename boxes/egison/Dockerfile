FROM esolang/ubuntu-base

RUN apt-get install wget -y && \
    cd /tmp/ && wget https://git.io/egison.x86_64.deb
RUN dpkg -i /tmp/egison.x86_64.deb && \
    rm /tmp/egison.x86_64.deb && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
# due to esolang-box's specification, move original egison to egison-interpreter
RUN mv /usr/bin/egison /usr/bin/egison-interpreter && \
    ln -s -f /bin/script /bin/egison

COPY script /root/script
