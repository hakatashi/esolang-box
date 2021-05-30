FROM esolang/python3

RUN apk add --update tar && \
    git clone https://github.com/SinaKhalili/Folders.py /root/Folders.py && \
    rm /bin/python3 && \
    echo -e "#!/bin/sh\ncat -" > /root/cat.sh && \
    chmod +x ~/cat.sh && \
    ln -s /bin/script /bin/pure-folders

COPY script /root/script
COPY disasm /root/disasm
