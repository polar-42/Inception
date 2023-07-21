#!/bin/sh

mkdir -p /var/www

chown -R mysql:mysql -R /var/lib
chown -R mysql:mysql -R /var/www

if [ -d "/run/mysqld" ]; then
    chown -R mysql:mysql /run/mysqld
else
    mkdir -p /run/mysqld
	chown -R mysql:mysql /run/mysqld
fi

if [ -d "/var/lib/mysql/${SQL_DATABASE}" ]; then
    chown -R mysql:mysql /var/lib/mysql
else
    chown -R mysql:mysql /var/lib/mysql

    mysql_install_db --user=mysql --ldata=/var/lib/mysql > /dev/null

    mkdir -p /var/tmp

    /usr/bin/mysqld --user=mysql --bootstrap --verbose=0 \
    --skip-networking=0 > /dev/null 2>&1 << EOF
    USE mysql;
    FLUSH PRIVILEGES ;
    CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;
    CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';
    GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';
    GRANT ALL ON *.* TO 'root'@'%' identified by '$SQL_ROOT_PASSWORD' WITH GRANT OPTION ;
    GRANT ALL ON *.* TO 'root'@'localhost' identified by '$SQL_ROOT_PASSWORD' WITH GRANT OPTION ;
    SET PASSWORD FOR 'root'@'localhost'=PASSWORD('${SQL_ROOT_PASSWORD}') ;
EOF
fi

if [ -d "/var/lib/mysql/${SQL_DATABASE}" ]; then
    echo ${SQL_DATABASE} is created
fi

exec /usr/bin/mysqld --user=mysql --skip-name-resolve \
    --skip-networking=0 2> /dev/null 2> /dev/null 