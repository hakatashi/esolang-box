FROM esolang/ubuntu-base

# On Ubuntu 20.04, setting this variable and install tzdata manually is required.
# Without DEBIAN_FRONTEND, On installation of dmd-compiler, an interactive instruction to setup timezone stop docker's image generation.
ENV DEBIAN_FRONTEND=noninteractive

RUN curl -L https://netcologne.dl.sourceforge.net/project/d-apt/files/d-apt.list -o /etc/apt/sources.list.d/d-apt.list && \
    apt-get update --allow-insecure-repositories && \
    apt-get -y --allow-unauthenticated install --reinstall d-apt-keyring && \
    apt-get update && \
    apt-get install -y tzdata && \
    apt-get install dmd-compiler dub -y && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    ln -s /bin/script /bin/d-dmd

COPY script /root/script
