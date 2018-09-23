FROM esolang/python3

RUN apk add --upgrade py3-pillow && \
  git clone --depth 1 https://github.com/HyogaGlacier/ExchangeIF.git ~/exchangeif && \
  rm -rf /var/cache/apk/* /tmp/* && \
  ln -s /bin/script /bin/exchangeif

COPY script /root/script
