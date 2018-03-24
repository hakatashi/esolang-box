FROM esolang/java

RUN curl -m $TIMEOUT http://lhartikk.github.io/ArnoldC.jar -o ~/ArnoldC.jar

COPY script /bin/script

RUN ln -s /bin/script /bin/arnoidc && \
    chmod 744 /bin -R

WORKDIR /root

CMD [ "script" ]
