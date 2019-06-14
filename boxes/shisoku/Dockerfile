FROM alpine:latest
RUN apk --update add ruby
COPY shisoku.rb /shisoku.rb
COPY shisoku.rb /shisoku

COPY script.sh /bin/script
COPY script.sh /bin/shisoku
RUN chmod 755 /bin/script
RUN chmod 755 /bin/shisoku


