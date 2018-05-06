FROM esolang/python3

RUN git clone --depth 1 https://github.com/Nazek42/arcyou.git ~/arcyou

COPY script /bin/script

RUN ln -s /bin/script /bin/arcyou && \
    chmod 744 /bin -R
