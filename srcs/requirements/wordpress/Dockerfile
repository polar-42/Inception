FROM alpine:3.17

RUN apk update
RUN apk add wget
RUN apk add mariadb-client
RUN apk add php
RUN apk add php-fpm 
RUN apk add php-common
RUN apk add php-phar

RUN addgroup -S nginx
RUN adduser -S nginx
RUN mkdir -p /var/www

RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www
RUN cd /var/www && tar -xvf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz
RUN chown -R root:root /var/www/wordpress

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /run/script

# RUN echo "clear_env = no" >> /etc/php81/php-fpm.d/www.conf
# RUN echo "listen=wordpress:9000" >> /etc/php81/php-fpm.d/www.conf

COPY tools/wordpress.sh /run/script/wordpress.sh
COPY conf/php-fpm.conf /etc/php81
COPY conf/www.conf /etc/php81/php-fpm.d/www.conf

RUN chmod 777 /run/script/wordpress.sh

ENV SQL_DATABASE="mariadb_test"
ENV SQL_USER="mariadb_user"
ENV SQL_PASSWORD="root"
ENV SQL_ROOT_PASSWORD="root"

EXPOSE 9000

ENTRYPOINT ["sh", "./run/script/wordpress.sh"]