FROM esolang/ubuntu-base

RUN cd /tmp && \
    apt-get install libwebkitgtk-1.0-0 -y && \
    curl -LO -m $TIMEOUT https://www.aliflang.org/alifstudio/AlifStudio2.tar.gz && \
    tar xf AlifStudio2.tar.gz && \
    cd AlifStudio2 && \
    sed -i "s/^sudo //" install.sh && \
    ./install.sh && \
    ln -s /usr/lib/x86_64-linux-gnu/libwebkitgtk-1.0.so.0 /usr/lib/x86_64-linux-gnu/libwebkitgtk-1.0.so && \
    ln -s /usr/lib/x86_64-linux-gnu/libsoup-2.4.so.1 /usr/lib/x86_64-linux-gnu/libsoup-2.4.so && \
    ln -s /usr/lib/x86_64-linux-gnu/libjavascriptcoregtk-1.0.so.0 /usr/lib/x86_64-linux-gnu/libjavascriptcoregtk-1.0.so && \
    apt --fix-broken install -y && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* && \
    ln -s /bin/script /bin/alif

COPY script /root/script
