all:
	docker-compose -f srcs/docker-compose.yml up -d

stop:
	docker stop mariadb wordpress nginx

clean:
#	docker rm $(docker ps -aq)
	docker system prune -af

