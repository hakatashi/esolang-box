FROM esolang/ubuntu-base

RUN apt-get update && \
    apt-get install software-properties-common apt-transport-https -y && \
    apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xB4112585D386EB94 && \
    add-apt-repository https://dl.hhvm.com/ubuntu && \
    apt-get update && \
    apt-get install hhvm -y && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY script /bin/script

RUN ln -s /bin/script /bin/hack && \
    chmod 744 /bin -R
