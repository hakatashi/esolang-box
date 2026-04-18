FROM esolang/ubuntu-base
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install software-properties-common apt-transport-https gnupg -y && \
    mkdir -p /etc/apt/keyrings && \
    gpg --no-default-keyring --keyring gnupg-ring:/etc/apt/keyrings/hhvm.gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0xB4112585D386EB94 && \
    chmod 644 /etc/apt/keyrings/hhvm.gpg && \
    bash -c '. /etc/os-release && echo "deb [signed-by=/etc/apt/keyrings/hhvm.gpg] https://dl.hhvm.com/ubuntu ${UBUNTU_CODENAME} main" > /etc/apt/sources.list.d/hhvm.list' && \
    apt-get update && \
    apt-get install hhvm -y && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    ln -s /bin/script /bin/hack

COPY script /root/script
