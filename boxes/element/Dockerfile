FROM esolang/perl

RUN curl -m $TIMEOUT https://github.com/PhiNotPi/Element/raw/master/InterpreterTIO.plx -L -o ~/element.plx && \
    ln -s /bin/script /bin/element && \
    rm /bin/perl

COPY script /bin/script

