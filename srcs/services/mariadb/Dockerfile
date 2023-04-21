FROM debian:buster

LABEL author.name="Hassan Sarhan"
LABEL author.email="hassanAsarhan@outlook.com"
LABEL author.intra="hsarhan"

# Update package lists and install mariadb
RUN apt-get -y update -y && \
    apt-get -y install curl software-properties-common gnupg2 && \
    curl -LsS -O https://downloads.mariadb.com/MariaDB/mariadb_repo_setup && \
    bash mariadb_repo_setup && \
    apt-get update -y && \
    apt-get -y install mariadb-server mariadb-client

# Get arguments from .env
ARG DB_NAME
ARG ADMIN_NAME
ARG ADMIN_PASS
ARG DB_USER_NAME
ARG DB_USER_PASS
ARG ROOT_PASS

RUN service mariadb start && \
    mariadb -u root -e "CREATE DATABASE IF NOT EXISTS ${DB_NAME};" && \
    mariadb -u root -e "CREATE USER IF NOT EXISTS '${DB_USER_NAME}'@'localhost' IDENTIFIED BY '${DB_USER_PASS}';" && \
    mariadb -u root -e "CREATE USER IF NOT EXISTS '${ADMIN_NAME}'@'localhost' IDENTIFIED BY '${ADMIN_PASS}';" && \
    mariadb -u root -e "FLUSH PRIVILEGES;" && \
    mariadb -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${ROOT_PASS}';"



CMD ["/bin/bash", "-c", "mysqld_safe"]
