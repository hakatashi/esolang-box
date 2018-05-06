FROM esolang/java

RUN cd /tmp && \
    curl -m $TIMEOUT "https://gist.github.com/satos---jp/16b0b863651178e7c33a9bec8dc9b538/raw/3f0788f6030cbcf1c25d405eb97946c72c5f0144/evli_interpreter_wopen_bug_fixed.java" -L -o evil.java && \
    /usr/lib/jvm/java-1.8-openjdk/bin/javac evil.java && \
    mv evil.class ~/evil.class

COPY script /bin/script

RUN ln -s /bin/script /bin/evil && \
    chmod 744 /bin -R
