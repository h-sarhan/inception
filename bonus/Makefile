R=\033[0;31m
G=\033[0;32m
Y=\033[0;33m
B=\033[0;34m
N=\033[0m

UNAME := $(shell uname)
VOL_DIR = /Users/hsarhan/data
ifeq ($(UNAME), Linux)
	VOL_DIR = /home/hsarhan/data
endif

set_vol_dir:
	@grep VOL_DIR ./srcs/.env  || echo "VOL_DIR=${VOL_DIR}" >> ./srcs/.env

build: set_vol_dir
	@docker compose -f srcs/docker-compose.yml build && \
	echo "\n$GBUILT CONTAINERS 🔨$N"

up: set_vol_dir
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

redis:
	@echo "\n$BINSIDE REDIS 🧱$N"
	@docker exec -it redis bash

ftp:
	@echo "\n$BINSIDE FTP 🗃 $N"
	@docker exec -it ftp bash

clean:
	@docker compose -f srcs/docker-compose.yml down && \
	echo "\n$YCLEANED CONTAINERS 🧼$N"

fclean:
	@docker compose -f srcs/docker-compose.yml down -v && \
	echo "\n$YSCRUBBED CONTAINERS AND THEIR VOLUMES 🛀$N"
	rm -rf ${VOL_DIR}/wp_db/*
	rm -rf ${VOL_DIR}/wp_data/*

re: set_vol_dir fclean up

.PHONY: build up mariadb nginx minecraft redis wordpress clean fclean re