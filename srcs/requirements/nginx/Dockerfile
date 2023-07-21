FROM alpine:3.17

RUN apk update
RUN apk add nginx
RUN apk add openssl

RUN mkdir -p /etc/nginx/cert
RUN openssl req -x509 -newkey rsa:2048 -nodes \
    -out /etc/nginx/cert/cert.crt \
    -keyout /etc/nginx/cert/key.key \
    -subj "/C=FR/ST=LA/L=Angouleme/O=42/OU=42/CN=fle-tolg.42.fr/UID=fle-tolg" \
    -days 365

RUN mkdir -p /var/run/nginx
RUN mkdir -p /var/www/wordpress

RUN mkdir -p /run/script

COPY conf/default.conf /etc/nginx/http.d/default.conf
COPY tools/run_nginx.sh /run/script/run_nginx.sh 

RUN chmod +x /run/script/run_nginx.sh

EXPOSE 443

ENTRYPOINT [ "/run/script/run_nginx.sh" ]