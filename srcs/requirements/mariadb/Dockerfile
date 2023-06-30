FROM alpine:3.17

RUN apk update
RUN apk add mariadb mariadb-common mariadb-client mariadb-server-utils mysql mysql-client openrc
RUN mkdir /run/openrc
RUN touch /run/openrc/softlevel
RUN rc-service mariadb setup
RUN rc-update add mariadb default
RUN rc-status
RUN rc-service mariadb start
#RUN mariadb-secure-installation

COPY tools/reload_mariadb.sh /run/script/reload_mariadb.sh

RUN chmod 777 /run/script/reload_mariadb.sh

CMD ["./run/script/reload_mariadb.sh"]
