all:
	docker compose -f srcs/docker-compose.yml up --build

stop:
	docker stop mariadb wordpress nginx

clean:
	docker system prune -af

