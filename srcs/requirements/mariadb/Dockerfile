FROM alpine:3.17

RUN apk update
RUN apk add mariadb mariadb-common mariadb-client mariadb-server-utils mysql mysql-client openrc
RUN mkdir /run/openrc
RUN touch /run/openrc/softlevel
RUN rc-service mariadb setup
RUN rc-update add mariadb default
RUN rc-status
#RUN rc-service mariadb start
#RUN mariadb-secure-installation

COPY tools/script.sh /run/script/script.sh
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN chmod 777 /run/script/script.sh

ENV SQL_DATABASE=TESTMARIADB
ENV SQL_USER=USERMARIADB
ENV SQL_PASSWORD=Inception42
ENV SQL_ROOT_PASSWORD=

#CMD ["sh", "./run/script/script.sh"]
ENTRYPOINT ["sh", "./run/script/script.sh"]
