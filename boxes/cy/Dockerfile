FROM esolang/ruby

RUN curl -m $TIMEOUT https://github.com/cyoce/Cy/raw/master/cy.rb -L -o ~/cy.rb && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/cy && \
    rm /bin/ruby

COPY script /bin/script

