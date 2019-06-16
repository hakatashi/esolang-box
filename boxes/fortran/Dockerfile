FROM esolang/build-base

RUN apk add --update gfortran && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/fortran

COPY script /root/script
