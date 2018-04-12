FROM esolang/ruby

RUN curl -m $TIMEOUT https://github.com/cyoce/Cy/raw/master/cy.rb -L -o ~/cy.rb && \
    rm -rf /var/cache/apk/* /tmp/*

COPY script /bin/script

RUN ln -s /bin/script /bin/cy && \
    rm /bin/ruby && \
    chmod 744 /bin -R

WORKDIR /root

CMD [ "script" ]
