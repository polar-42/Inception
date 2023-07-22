FROM alpine:3.17

RUN apk update
RUN apk add mariadb mariadb-common mariadb-client mariadb-server-utils mysql mysql-client
RUN apk add openrc

COPY tools/mariadb.sh /run/script/mariadb.sh
COPY conf/mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf

RUN chmod +x /run/script/mariadb.sh

EXPOSE 3306

ENTRYPOINT ["./run/script/mariadb.sh"]