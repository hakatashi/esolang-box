FROM esolang/ubuntu-base

RUN apt-get update && \
    apt-get install -y openjdk-21-jdk maven git curl unzip && \
    git clone --depth 1 https://github.com/iamgio/pikt.git /tmp/pikt && \
    cd /tmp/pikt && \
    mvn -B package -DskipTests && \
    mkdir -p ~/pikt/libraries && \
    cp core/target/pikt.jar ~/pikt/pikt.jar && \
    cp stdlib/target/stdlib.jar ~/pikt/libraries/stdlib.jar && \
    curl -L "https://github.com/JetBrains/kotlin/releases/download/v1.9.21/kotlin-compiler-1.9.21.zip" \
        -o /tmp/kotlin.zip && \
    unzip /tmp/kotlin.zip -d ~/ && \
    rm -rf /tmp/pikt /tmp/kotlin.zip /root/.m2 /var/lib/apt/lists/* && \
    ln -s /bin/script /bin/pikt

COPY script /root/script
