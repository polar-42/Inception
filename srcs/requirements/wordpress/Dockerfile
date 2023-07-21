FROM alpine:3.17

RUN apk update
RUN apk add wget
RUN apk add mariadb-client
RUN apk add php
RUN apk add php-fpm 
RUN apk add php-common
RUN apk add php-phar
RUN apk add php-mysqli
RUN apk add php-iconv

RUN addgroup -S nginx
RUN adduser -S nginx

RUN mkdir -p /var/www

RUN chown -R root:root -R /var/www

RUN mkdir -p /run/script

COPY tools/wordpress.sh /run/script/wordpress.sh
COPY conf/php-fpm.conf /etc/php81
COPY conf/www.conf /etc/php81/php-fpm.d/www.conf

RUN chmod +x /run/script/wordpress.sh

EXPOSE 9000

ENTRYPOINT ["sh", "./run/script/wordpress.sh"]