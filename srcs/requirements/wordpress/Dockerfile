FROM alpine:3.17

RUN apk update
RUN apk add wget
RUN apk add mariadb-client
RUN apk add php
RUN apk add php-fpm 
RUN apk add php-common
RUN apk add php-phar
RUN apk add php-mysqli

RUN addgroup -S nginx
RUN adduser -S nginx
# RUN mkdir -p /var/www/wordpress

RUN mkdir -p /var/www

# RUN chown -R root:root -R /var/lib
# RUN chown -R root:root -R /var/www
# RUN chown -R root:root /var/www
# RUN chown -R root:root /var/lib
# RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www
# RUN cd /var/www/ && tar -xvf wordpress-6.0-fr_FR.tar.gz

RUN chown -R root:root -R /var/www

# RUN wget https://wordpress.org/wordpress-6.2.2.tar.gz -P /var/www
# RUN cd /var/www/ && tar -xzvf wordpress-6.2.2.tar.gz

# RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
# RUN chmod +x wp-cli.phar
# RUN mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /run/script

COPY tools/wordpress.sh /run/script/wordpress.sh
COPY conf/php-fpm.conf /etc/php81
COPY conf/www.conf /etc/php81/php-fpm.d/www.conf
# COPY conf/wp-config.php /var/www/wordpress/wp-config.php

RUN chmod +x /run/script/wordpress.sh

ENV SQL_DATABASE="mariadb_test"
ENV SQL_USER="mariadb_user"
ENV SQL_PASSWORD="root"
ENV SQL_ROOT_PASSWORD="root"
ENV DB_NAME="mariadb_test"
ENV DB_USER="mariadb_user"
ENV DB_PASSWORD="root"
ENV DB_HOST = "mariadb"

EXPOSE 9000

ENTRYPOINT ["sh", "./run/script/wordpress.sh"]