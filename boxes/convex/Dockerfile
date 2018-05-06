FROM esolang/java

RUN curl -m $TIMEOUT https://github.com/GamrCorps/Convex/raw/master/out/builds/convex-0.9/convex/convex.jar -L -o ~/convex.jar && \
    ln -s /bin/script /bin/convex && \
    rm /bin/java

COPY script /bin/script

