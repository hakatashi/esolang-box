FROM esolang/java

RUN curl -m $TIMEOUT http://lhartikk.github.io/ArnoldC.jar -o ~/ArnoldC.jar && \
    ln -s /bin/script /bin/arnoidc && \
    rm /bin/java

COPY script /root/script
