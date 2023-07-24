all:
	@mkdir -p /home/fle-tolg/data/wordpress
	@mkdir -p /home/fle-tolg/data/mariadb
	@echo Docker is launching...
	@docker compose -f srcs/docker-compose.yml up --build -d
	@echo Docker is launch in detach mode

no-detach:
	@mkdir -p /home/fle-tolg/data/wordpress
	@mkdir -p /home/fle-tolg/data/mariadb
	@echo Docker is launching...
	@docker compose -f srcs/docker-compose.yml up --build

restart:
	@mkdir -p /home/fle-tolg/data/wordpress
	@mkdir -p /home/fle-tolg/data/mariadb
	@echo Docker is launching...
	@docker compose -f srcs/docker-compose.yml up -d
	@echo Docker is launch in detach mode

status:
	@docker ps

info:
	@docker image ls; echo
	@docker volume ls; echo
	@docker network ls

stop:
	@docker stop container_mariadb container_wordpress container_nginx
	@echo All containers have been stopped

clean:
	@docker system prune -af
	@docker volume rm srcs_wordpress srcs_mariadb; true
	@sudo rm -rf /home/fle-tolg/data
	@echo All images, stopped containers, networks and volumes have been deleted

re: stop clean all