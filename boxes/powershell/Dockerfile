FROM esolang/ubuntu-base

RUN (curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -) && \
    bash -c "echo \"deb [arch=amd64] https://packages.microsoft.com/ubuntu/16.04/prod xenial main\" > /etc/apt/sources.list.d/microsoft.list" && \
    apt-get update && \
    apt-get install powershell -y && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY script /bin/script

RUN ln -s /bin/script /bin/powershell && \
    chmod 744 /bin -R

WORKDIR /root

CMD [ "script" ]
