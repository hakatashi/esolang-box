FROM esolang/java

RUN curl -m $TIMEOUT https://github.com/GamrCorps/Convex/raw/master/out/builds/convex-0.9/convex/convex.jar -L -o ~/convex.jar

COPY script /bin/script

RUN ln -s /bin/script /bin/convex && \
    rm /bin/java && \
    chmod 744 /bin -R
