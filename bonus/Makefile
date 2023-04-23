R=\033[0;31m
G=\033[0;32m
Y=\033[0;33m
B=\033[0;34m
N=\033[0m

build:
	@docker compose -f srcs/docker-compose.yml build && \
	echo "\n$GBUILT CONTAINERS 🔨$N"

up:
	@docker compose -f srcs/docker-compose.yml up --build -d && \
	echo "\n$GCONTAINERS UP AND RUNNING IN THE BACKGROUND ✅$N"

mariadb:
	@echo "\n$BINSIDE MARIADB 🗄$N"
	@docker exec -it mariadb bash

nginx:
	@echo "\n$BINSIDE NGINX 👩‍💻$N"
	@docker exec -it nginx bash

wordpress:
	@echo "\n$BINSIDE WORDPRESS 🤓$N"
	@docker exec -it wordpress bash

minecraft:
	@echo "\n$BINSIDE MINECRAFT 🌲🪓$N"
	@docker exec -it minecraft bash

clean:
	@docker compose -f srcs/docker-compose.yml down && \
	echo "\n$YCLEANED CONTAINERS 🧼$N"

fclean:
	@docker compose -f srcs/docker-compose.yml down -v && \
	echo "\n$YSCRUBBED CONTAINERS AND THEIR VOLUMES 🛀$N"
	rm -rf ${HOME}/data/wp_db/*
	rm -rf ${HOME}/data/wp_data/*

re: fclean up

.PHONY: build up mariadb nginx wordpress clean fclean re