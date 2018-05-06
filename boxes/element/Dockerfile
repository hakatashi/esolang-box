FROM esolang/perl

RUN curl -m $TIMEOUT https://github.com/PhiNotPi/Element/raw/master/InterpreterTIO.plx -L -o ~/element.plx

COPY script /bin/script

RUN ln -s /bin/script /bin/element && \
    rm /bin/perl && \
    chmod 744 /bin -R
