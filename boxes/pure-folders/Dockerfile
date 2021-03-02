FROM esolang/python3

RUN git clone https://github.com/SinaKhalili/Folders.py /root/Folders.py && \
    rm /bin/python3 && \
    ln -s /bin/script /bin/pure-folders

COPY script /root/script
COPY disasm /root/disasm
