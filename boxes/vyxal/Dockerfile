FROM esolang/java

RUN cd ~ && \
    curl -m $TIMEOUT "https://github.com/Vyxal/Vyxal/releases/download/v3.11/vyxal-3.11.0.jar" -L -o vyxal.jar && \
    ln -s /bin/script /bin/vyxal

COPY script /root/script
