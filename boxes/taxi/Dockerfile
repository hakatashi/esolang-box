FROM esolang/build-base

RUN cd /tmp && \
    git clone https://github.com/BigZaphod/Taxi.git && \
    g++ -O2 -Wall Taxi/source/taxi.cpp -o taxi -DNO_GREETINGS && \
    mv taxi /usr/bin/taxi && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/taxi

COPY script /root/script
