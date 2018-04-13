FROM esolang/node

RUN git clone --depth 1 https://github.com/TehFlaminTaco/MaybeLater.git ~/MaybeLater

COPY script /bin/script

RUN ln -s /bin/script /bin/maybelater && \
    chmod 744 /bin -R

WORKDIR /root

CMD [ "script" ]
