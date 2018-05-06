FROM esolang/build-base

RUN cd /tmp \
    && curl -m $TIMEOUT https://github.com/shinh/ags/raw/master/be/srv/ag_launcher.c -LO \
    && gcc -O2 -Wall -o /usr/bin/ag_launcher ag_launcher.c && \
    ln -s /bin/script /bin/make

COPY script /root/script
