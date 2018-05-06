FROM esolang/ubuntu-base

RUN apt-key adv --keyserver keys.gnupg.net --recv-keys EBCF975E5BA24D5E && \
    bash -c "echo \"deb http://master.dl.sourceforge.net/project/d-apt/ d-apt main\" > /etc/apt/sources.list.d/d-apt.list" && \
    apt-get update && \
    apt-get install dmd-compiler -y && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    ln -s /bin/script /bin/d-dmd

COPY script /root/script
