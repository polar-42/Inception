#!/bin/sh

rc-service mariadb start

if [ ! -d "/var/lib/mysql/${SQL_DATABASE}" ]; then

    mariadb-secure-installation << EOF

    n
    y
    Inception42
    Inception42
    y
    y
    y
    y
EOF

    mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"
    mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"
    mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
    mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
    mysql -e "FLUSH PRIVILEGES;"
    #mysqladmin -u root -p$SQL_ROOT_PASSWORD #shutdown

    #exec mysqld_safe

    echo SUCESS
fi

#mysqld_safe --skip-grant-tables
