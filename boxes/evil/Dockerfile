FROM esolang/java

# javac is installed in /usr/lib/jvm/default-jvm/bin/
RUN cd /tmp && \
    curl -m $TIMEOUT "https://gist.github.com/satos---jp/16b0b863651178e7c33a9bec8dc9b538/raw/3f0788f6030cbcf1c25d405eb97946c72c5f0144/evli_interpreter_wopen_bug_fixed.java" -L -o evil.java && \
    javac evil.java && \
    mv evil.class ~/evil.class && \
    ln -s /bin/script /bin/evil

COPY script /root/script
