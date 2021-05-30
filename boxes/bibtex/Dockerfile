FROM esolang/tex
RUN ln -s /bin/script /bin/bibtex && \
    rm /bin/tex
COPY script /root/script
COPY source.aux /root/source.aux
