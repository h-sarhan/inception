FROM debian:buster

# Setting labels
LABEL author.name="Hassan Sarhan"
LABEL author.email="hassanAsarhan@outlook.com"
LABEL author.intra="hsarhan"

# Update package lists and install mariadb
RUN apt-get -y update -y && \
    apt-get -y install curl software-properties-common gnupg2 && \
    curl -LsS -O https://downloads.mariadb.com/MariaDB/mariadb_repo_setup && \
    bash mariadb_repo_setup && \
    apt-get update -y && \
    apt-get -y install mariadb-server mariadb-client  sudo

# Get arguments from docker-compose file
ARG DB_NAME
ARG ADMIN_NAME
ARG ADMIN_PASS
ARG DB_USER_NAME
ARG DB_USER_PASS
ARG ROOT_PASS

# Replace two lines in mariadb config so that it uses ports rather than sockets
RUN sed -i '/^# port =/c\port = 3306'  /etc/mysql/my.cnf && \
    sed -i '/^bind-address/c\bind-address = 0.0.0.0'   /etc/mysql/mariadb.conf.d/50-server.cnf && \
    sed -i '/^socket =/c\# socket ='  /etc/mysql/my.cnf
    # echo "[mysqld]\nskip-networking=0\nskip-bind-address" >> /etc/mysql/my.cnf

EXPOSE 3306

# # Start and initialize mariadb
RUN service mariadb start && \
    # Create database
    mariadb -u root -e "CREATE DATABASE IF NOT EXISTS ${DB_NAME};FLUSH PRIVILEGES;" && \
    # Create WordPress user
    mariadb -u root -e "CREATE USER IF NOT EXISTS '${DB_USER_NAME}'@'%' IDENTIFIED BY '${DB_USER_PASS}';FLUSH PRIVILEGES;" && \
    # Create WordPress Admin user
    mariadb -u root -e "CREATE USER IF NOT EXISTS '${ADMIN_NAME}'@'%' IDENTIFIED BY '${ADMIN_PASS}';FLUSH PRIVILEGES;" && \
    mariadb -u root -e "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${ADMIN_NAME}'@'%' IDENTIFIED BY '${ADMIN_PASS}' WITH GRANT OPTION;FLUSH PRIVILEGES;" && \
    # Change root pass
    mariadb -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${ROOT_PASS}';"

# Run mariadb when container starts
CMD ["/bin/bash", "-c", "mysqld_safe"]
