FROM debian:buster

LABEL author.name="Hassan Sarhan"
LABEL author.email="hassanAsarhan@outlook.com"
LABEL author.intra="hsarhan"

# Update package lists and install mariadb
RUN apt -y update -y && \
    apt -y install curl software-properties-common gnupg2 && \
    curl -LsS -O https://downloads.mariadb.com/MariaDB/mariadb_repo_setup && \
    bash mariadb_repo_setup && \
    apt update -y && \
    apt -y install mariadb-server mariadb-client
    # mkdir /var/run/mysqld && \
    # chown -R mysql:mysql /var/run/mysqld

# Get arguments from .env
# ARG DB_NAME
# ARG ROOT_PASS
# ARG DB_USER
# ARG USER_PASS

# RUN mariadb -u root -e "CREATE DATABASE ${DB_NAME};"

CMD ["/bin/bash", "-c", "mysqld_safe"]
