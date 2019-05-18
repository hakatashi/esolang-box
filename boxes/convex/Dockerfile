FROM esolang/java

RUN curl -m $TIMEOUT https://github.com/GamrCorps/Convex/raw/master/out/builds/convex-dev/convex/convex.jar -L -o ~/convex.jar && \
    ln -s /bin/script /bin/convex && \
    rm /bin/java

COPY script /root/script
