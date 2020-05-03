FROM esolang/ruby

RUN rm /bin/ruby && \
    git clone --depth 1 https://github.com/ConorOBrien-Foxx/Pyramid-Scheme.git ~/Pyramid-Scheme && \
    ln -s /bin/script /bin/pyramid-scheme

COPY script /root/script
