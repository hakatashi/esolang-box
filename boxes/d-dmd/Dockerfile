FROM esolang/ubuntu-base

RUN curl -L https://netcologne.dl.sourceforge.net/project/d-apt/files/d-apt.list -o /etc/apt/sources.list.d/d-apt.list && \
    apt-get update --allow-insecure-repositories && \
    apt-get -y --allow-unauthenticated install --reinstall d-apt-keyring && \
    apt-get update && \
    apt-get install dmd-compiler dub -y && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    ln -s /bin/script /bin/d-dmd

COPY script /root/script
