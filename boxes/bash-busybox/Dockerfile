FROM esolang/bash-pure

RUN mv /opt/jails/bash-pure /opt/jails/bash-busybox && \
    cp /bin/busybox /opt/jails/bash-busybox/bin/busybox && \
    (busybox --list | xargs -I {} ln -s /bin/busybox /opt/jails/bash-busybox/bin/{}) && \
    ln -s /bin/script /bin/bash-busybox && \
    rm /bin/bash-pure

COPY script /root/script
