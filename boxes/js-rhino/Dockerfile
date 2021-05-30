FROM esolang/java

RUN cd /tmp && \
    curl -m 30 https://github.com/mozilla/rhino/releases/download/Rhino1_7_13_Release/rhino-1.7.13.jar -LO && \
    mv rhino-1.7.13.jar /usr/bin/js.jar && \
    ln -s /bin/script /bin/js-rhino

COPY script /root/script
