#!/bin/sh

if [ ! -d "/var/www/wordpress/wp-admin" ]; then

    wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -q
    chmod +x wp-cli.phar
    mv wp-cli.phar /usr/local/bin/wp

    wget https://wordpress.org/wordpress-6.2.2.tar.gz -q -P /var/www
    cd /var/www/ && tar -xzf wordpress-6.2.2.tar.gz

    sed -i "s/database_name_here/$SQL_DATABASE/g" /var/www/wordpress/wp-config-sample.php
    sed -i "s/username_here/$SQL_USER/g" /var/www/wordpress/wp-config-sample.php
    sed -i "s/password_here/$SQL_PASSWORD/g" /var/www/wordpress/wp-config-sample.php
    sed -i "s/localhost/mariadb/g" /var/www/wordpress/wp-config-sample.php

    cp /var/www/wordpress/wp-config-sample.php /var/www/wordpress/wp-config.php

    cd /var/www/wordpress && wp core install --allow-root --url=$DOMAIN_NAME \
        --title=Inception \
        --admin_user=$SQL_USER --admin_password=$SQL_PASSWORD \
        --admin_email=fle-tolg@student.42angouleme.fr --skip-email

    cd /var/www/wordpress && wp user create $SQL_SECOND_USER \
        $SQL_SECOND_USER@null.com \
        --user_pass=$SQL_PASSWORD_SECOND_USER --quiet
else
    echo "Wordpress already installed"
fi

echo "Wordpress is ready to use"

php-fpm81 -F -e