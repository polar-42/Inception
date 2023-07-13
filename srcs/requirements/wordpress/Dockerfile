FROM alpine:3.17

RUN apk update
RUN apk add wget
RUN apk add php
RUN apk add php-fpm 
RUN apk add php-common
RUN apk add php-phar
#RUN apk add php-mysql 
RUN apk add mariadb-client

RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www
RUN cd /var/www && tar -xvf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz
RUN chown -R root:root /var/www/wordpress

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod 777 wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /run/script

COPY conf/install_wordpress.sh /run/script/install_wordpress.sh

RUN chmod 777 /run/script/install_wordpress.sh

EXPOSE 9000

#ENTRYPOINT ["sh", "./run/script/install_wordpress.sh"]
