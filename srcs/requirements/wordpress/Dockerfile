FROM alpine:3.17

RUN apk update
RUN apk add lighttpd 
RUN apk add php
RUN apk add php-fpm
#php7-session php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom php7-simplexml

RUN mkdir -p /usr/share/webapps/
RUN cd /usr/share/webapps/
RUN wget http://wordpress.org/latest.tar.gz
RUN tar -xzvf latest.tar.gz
RUN rm latest.tar.gz
RUN chown -R lighttpd /usr/share/webapps/
RUN ln -s /usr/share/webapps/wordpress/ /var/www/localhost/htdocs/wordpress

ENV h=HELLO_WORLD


