#!/bin/sh

#sleep 10


# wp config create --path='/var/www/wordpress' \
#     --dbname=$SQL_DATABASE \
#     --dbuser=$SQL_USER --allow-root \
#     --dbpass=$SQL_PASSWORD --dbhost=mariadb:3306


# /usr/sbin/php-fpm81


chown -R nginx:www-data /var

mkdir -p /usr/logs/php-fpm
mkdir -p /usr/html

php-fpm81
