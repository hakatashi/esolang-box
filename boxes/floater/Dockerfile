FROM esolang/java

RUN git clone --depth 1 https://github.com/Zom-B/Floater.git ~/Floater && \
    cd ~/Floater && \
    /usr/bin/javac -encoding UTF-8 `find . -name "*.java"` && \
    ln -s /bin/script /bin/floater && \
    rm /bin/java

COPY script /root/script
