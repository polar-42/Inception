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
    echo $SQL_DATABASE is already created
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
    echo ${SQL_DATABASE} is create

    # wp user create ${SQL_SECOND_USER} ${SQL_SECOND_USER}@null.com \
    #     --user_pass=$SQL_PASSWORD_SECOND_USER
    #     --user_registered="2023-12-24-20-00-00"
fi

exec /usr/bin/mysqld --user=mysql --skip-name-resolve \
    --skip-networking=0 2> /dev/null