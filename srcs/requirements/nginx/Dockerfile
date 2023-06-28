FROM alpine:3.17

RUN apk install update
RUN apk add nginx
RUN apk add openssl
RUN openssl req -x509 -nodes -out /etc/nginx/cert.pem -keyout /etc/nginx/key.pem -subj "/C=FR/ST=LA/L=Angouleme/O=42/OU=42/CN=fle-tolg.42.fr/UID=fle-tolg"
RUN mkdir -p /var/run/nginx

COPY conf/nginx.conf /etc/nginx/nginx.conf
#COPY conf/default /etc/nginx/sites-available/default
#COPY index.html /usr/share/nginx/html/

EXPOSE 443

CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
