FROM esolang/perl

COPY slashes.pl /root/slashes.pl
COPY script /bin/script

RUN ln -s /bin/script /bin/slashes && \
    rm /bin/perl && \
    chmod 744 /bin -R

WORKDIR /root

CMD [ "script" ]
