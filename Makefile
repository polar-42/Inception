all:
	@echo Docker is launching...
	@docker compose -f srcs/docker-compose.yml up --build

detach:
	@docker compose -f srcs/docker-compose.yml up --build -d
	@echo Docker is launch in detach mode

stop:
	@docker stop mariadb wordpress nginx
	@echo All containers have been stopped

clean:
	@docker system prune -af --volumes
	@sudo rm -rf /home/fle-tolg/data
	@echo All images, stopped containers, networks and volumes have been deleted

re: stop clean all