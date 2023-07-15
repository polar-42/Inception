FROM alpine:3.17

RUN apk update
RUN apk add nginx
RUN apk add openssl
RUN mkdir -p /etc/nginx/cert
RUN openssl req -x509 -newkey rsa:2048 -nodes -out /etc/nginx/cert/cert.crt -keyout /etc/nginx/cert/key.key -subj "/C=FR/ST=LA/L=Angouleme/O=42/OU=42/CN=fle-tolg.42.fr/UID=fle-tolg" -days 365
RUN mkdir -p /var/run/nginx
RUN mkdir -p /var/www/html
#RUN chmod 755 /var/www/html
#RUN adduser -S www-data
#RUN addgroup -S www-data www-data
#RUN chown -R www-data:www-data /var/www/html
RUN mkdir -p /run/script
RUN echo "nginx -g 'daemon off;'" > /run/script/launch.sh
RUN chmod +x /run/script/launch.sh

COPY conf/default.conf /etc/nginx/http.d/default.conf

EXPOSE 443

#CMD ["nginx", "-g", "daemon off;"]
ENTRYPOINT ["sh", "./run/script/launch.sh"]
