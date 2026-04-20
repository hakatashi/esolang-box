FROM esolang/ubuntu-base

RUN apt-get update && \
    apt-get install -y python3 python3-pip && \
    pip3 install qsharp --break-system-packages && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    ln -s /bin/script /bin/qsharp

COPY run_qsharp.py /root/run_qsharp.py
COPY script /root/script
