#!/bin/sh

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

    /usr/bin/mysqld --user=mysql --bootstrap --verbose=0 \
    --skip-name-resolve --skip-networking=0 << EOF
    USE mysql;
    FLUSH PRIVILEGES ;
    GRANT ALL ON *.* TO 'root'@'%' identified by '$SQL_ROOT_PASSWORD' WITH GRANT OPTION ;
    GRANT ALL ON *.* TO 'root'@'localhost' identified by '$SQL_ROOT_PASSWORD' WITH GRANT OPTION ;
    SET PASSWORD FOR 'root'@'localhost'=PASSWORD('${SQL_ROOT_PASSWORD}') ;
    DROP DATABASE IF EXISTS test ;
    FLUSH PRIVILEGES ;
EOF
fi
    # mkdir /run/openrc
    # touch /run/openrc/softlevel
    # rc-service mariadb setup
    # rc-update add mariadb default
    # rc-status
    # rc-service mariadb start

    # mariadb-secure-installation << EOF
    
    # n
    # y
    # ${SQL_PASSWORD}
    # ${SQL_PASSWORD}
    # y
    # y
    # y
    # y
# EOF

# mysql -uroot -p$SQL_PASSWORD << EOF
# CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;
# CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';
# GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';
# ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';
# FLUSH PRIVILEGES;
# EOF
#     #mysqladmin -u root -p$SQL_ROOT_PASSWORD #shutdown

#     #exec mysqld_safe

#     #echo SUCESS
# fi

# mysqld_safe -uroot -p$SQL_PASSWORD --skip-grant-tables

if [ -d "/var/lib/mysql/${SQL_DATABASE}" ]; then
    echo Completed
fi

exec /usr/bin/mysqld --user=mysql --console --skip-name-resolve \
    --skip-networking=0 > /dev/null
    