FROM esolang/python2

RUN git clone --depth 1 https://github.com/kade-robertson/stuck.git ~/stuck

COPY script /bin/script

RUN ln -s /bin/script /bin/stuck && \
    rm /bin/python2 && \
    chmod 744 /bin -R

WORKDIR /root

CMD [ "script" ]
