FROM alpine:3.17

RUN apk update
RUN apk add mariadb mariadb-common mariadb-client mariadb-server-utils mysql mysql-client
RUN apk add openrc
# RUN mkdir /run/openrc
# RUN touch /run/openrc/softlevel
# RUN rc-service mariadb setup
# RUN rc-update add mariadb default
# RUN rc-status
#RUN rc-service mariadb start
#RUN mariadb-secure-installation

COPY tools/mariadb.sh /run/script/mariadb.sh
COPY conf/mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf

RUN chmod +x /run/script/mariadb.sh
# RUN chown -R mysql:mysql -R /var/lib
# RUN chown -R mysql:mysql -R /var/www

ENV SQL_DATABASE="mariadb_test"
ENV SQL_USER="mariadb_user"
ENV SQL_PASSWORD="root"
ENV SQL_ROOT_PASSWORD="root"


EXPOSE 3306

#CMD ["sh", "./run/script/script.sh"]
ENTRYPOINT ["sh", "./run/script/mariadb.sh"]