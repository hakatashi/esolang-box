FROM esolang/java

RUN cd /tmp && \
    curl -m 30 https://github.com/mozilla/rhino/releases/download/Rhino1_7_9_Release/rhino-1.7.9.jar -LO && \
    mv rhino-1.7.9.jar /usr/bin/js.jar

COPY script /bin/script

RUN ln -s /bin/script /bin/js-rhino && \
    chmod 744 /bin -R

WORKDIR /root

CMD [ "script" ]
