FROM esolang/java

RUN git clone --depth 1 https://github.com/Zom-B/Floater.git ~/Floater && \
    cd ~/Floater && \
    /usr/lib/jvm/java-1.8-openjdk/bin/javac -encoding UTF-8 `find . -name "*.java"`

COPY script /bin/script

RUN ln -s /bin/script /bin/floater && \
    rm /bin/java && \
    chmod 744 /bin -R

WORKDIR /root

CMD [ "script" ]
