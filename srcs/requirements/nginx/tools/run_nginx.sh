#!/bin/sh

sed -i "s/SERVERNAME/$DOMAIN_NAME/g" /etc/nginx/http.d/default.conf

if [ ! -d "/var/www/wordpress/static_page" ];then

    mkdir -p /var/www/wordpress/static_page

    mv /tmp/index.html /var/www/wordpress/static_page/
fi

nginx -g 'daemon off;'