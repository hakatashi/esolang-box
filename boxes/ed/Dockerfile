FROM esolang/ubuntu-base

RUN apt-get install ed
RUN mv /usr/bin/ed /usr/bin/ed-original
RUN ln -s /bin/script /bin/ed
COPY script /root/script
