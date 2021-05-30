FROM esolang/ubuntu-base

ENV DEBIAN_FRONTEND=noninteractive
RUN (curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -) && \
    bash -c "echo \"deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-ubuntu-focal-prod focal main\" > /etc/apt/sources.list.d/microsoft.list" && \
    apt-get update && \
    apt-get install -y tzdata && \
    apt-get install powershell -y && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    ln -s /bin/script /bin/powershell

COPY script /root/script
