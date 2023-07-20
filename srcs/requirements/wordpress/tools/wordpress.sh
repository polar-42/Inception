#!/bin/sh

#sleep 10


# wp config create --path='/var/www/wordpress' \
#     --dbname=$SQL_DATABASE \
#     --dbuser=$SQL_USER --allow-root \
#     --dbpass=$SQL_PASSWORD --dbhost=mariadb:3306


# /usr/sbin/php-fpm81


# chown -R nginx:www-data /var

# mkdir -p /usr/logs/php-fpm
# mkdir -p /usr/html

# wget https://wordpress.org/wordpress-6.2.2.tar.gz -P /var/www
# cd /var/www/ && tar -xzvf wordpress-6.2.2.tar.gz

if [ ! -d "/var/www/wordpress/wp-admin" ]; then

    sleep 10
    wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar
    mv wp-cli.phar /usr/local/bin/wp

    wget https://wordpress.org/wordpress-6.2.2.tar.gz -P /var/www
    cd /var/www/ && tar -xzvf wordpress-6.2.2.tar.gz

    sed -i "s/database_name_here/$SQL_DATABASE/g" /var/www/wordpress/wp-config-sample.php
    sed -i "s/username_here/$SQL_USER/g" /var/www/wordpress/wp-config-sample.php
    sed -i "s/password_here/$SQL_PASSWORD/g" /var/www/wordpress/wp-config-sample.php
    sed -i "s/localhost/mariadb/g" /var/www/wordpress/wp-config-sample.php

    cp /var/www/wordpress/wp-config-sample.php /var/www/wordpress/wp-config.php

    cd /var/www/wordpress && wp core install --allow-root --url=fle-tolg.42.fr \
        --title=FleTolgInception \
        --admin_user=$SQL_USER --admin_password=$SQL_PASSWORD \
        --admin_email=fle-tolg@student.42angouleme.fr --skip-email
fi

php-fpm81 -F -R
