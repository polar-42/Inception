FROM alpine:3.17

RUN apk update
RUN apk add wget php php-fpm  php-common php-phar php-mysqli php-iconv mariadb-client

RUN addgroup -S wordpress
RUN adduser -S wordpress

RUN mkdir -p /var/www

RUN chown -R root:root -R /var/www

RUN mkdir -p /run/script

COPY tools/wordpress.sh /run/script/wordpress.sh
COPY conf/php-fpm.conf /etc/php81
COPY conf/www.conf /etc/php81/php-fpm.d/www.conf

RUN chmod +x /run/script/wordpress.sh

EXPOSE 9000

ENTRYPOINT ["./run/script/wordpress.sh"]