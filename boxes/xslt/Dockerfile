FROM esolang/java

RUN cd /tmp && \
    curl -m $TIMEOUT -LO https://sourceforge.net/projects/saxon/files/Saxon-HE/10/Java/SaxonHE10-3J.zip && \
    unzip SaxonHE10-3J.zip && \
    mv saxon-he-10.3.jar ~/saxonhe.jar && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/xslt && \
    rm /bin/java

COPY script /root/script
COPY preprocess.xsl /root/preprocess.xsl
