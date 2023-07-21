#!/bin/sh

sed -i "s/SERVERNAME/$DOMAIN_NAME/g" /etc/nginx/http.d/default.conf

nginx -g 'daemon off;'