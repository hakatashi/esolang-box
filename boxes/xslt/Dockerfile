FROM esolang/java

RUN cd /tmp && \
    curl -m $TIMEOUT -LO https://sourceforge.net/projects/saxon/files/Saxon-HE/9.9/SaxonHE9-9-1-3J.zip && \
    unzip SaxonHE9-9-1-3J.zip && \
    mv saxon9he.jar ~ && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/xslt && \
    rm /bin/java

COPY script /root/script
COPY preprocess.xsl /root/preprocess.xsl
