FROM esolang/ubuntu-base

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-key adv --keyserver keys.gnupg.net --recv-keys 09617FD37CC06B54 && \
    bash -c "echo \"deb https://dist.crystal-lang.org/apt crystal main\" > /etc/apt/sources.list.d/crystal.list" && \
    apt-get update && \
    apt-get install -y tzdata && \
    apt-get install crystal -y && \
    apt-get autoremove -y && \
    apt-get clean

# due to esolang-box's specification, move original crystal to crystal-interpreter
RUN rm -rf /var/lib/apt/lists/* && \
    mv /usr/bin/crystal /usr/bin/crystal-interpreter && \
    ln -s /bin/script /bin/crystal

COPY script /root/script
