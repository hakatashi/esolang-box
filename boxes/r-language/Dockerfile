FROM esolang/build-base

RUN apk add --update R

RUN ln -s /bin/script /bin/r && \
    ln -s /home/R/bin/Rscript /bin/Rscript && \
    cd .. && \
    rm -rf R-*

COPY script /root/script

