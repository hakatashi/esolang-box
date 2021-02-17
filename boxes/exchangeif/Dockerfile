FROM esolang/python3

RUN apk add --upgrade py3-pillow && \
  git clone --depth 1 https://github.com/hiromi-mi/ExchangeIF.git ~/exchangeif

RUN rm -rf /var/cache/apk/* /tmp/* && \
  ln -s /bin/script /bin/exchangeif

COPY script /root/script
