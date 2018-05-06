FROM esolang/java

RUN curl -m $TIMEOUT https://sourceforge.net/projects/cjam/files/cjam-0.6.5/cjam-0.6.5.jar -L -o ~/cjam-0.6.5.jar

COPY script /bin/script

RUN ln -s /bin/script /bin/cjam && \
    rm /bin/java && \
    chmod 744 /bin -R
