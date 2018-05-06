FROM esolang/ubuntu-base

RUN apt-key adv --keyserver keys.gnupg.net --recv-keys 09617FD37CC06B54 && \
    bash -c "echo \"deb https://dist.crystal-lang.org/apt crystal main\" > /etc/apt/sources.list.d/crystal.list" && \
    apt-get update && \
    apt-get install crystal -y && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY script /bin/script

RUN ln -s /bin/script /bin/crystal && \
    chmod 744 /bin -R
