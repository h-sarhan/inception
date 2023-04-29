FROM debian:buster

# Setting labels
LABEL author.name="Hassan Sarhan"
LABEL author.email="hassanAsarhan@outlook.com"
LABEL author.intra="hsarhan"
LABEL description="A Mariadb server Docker image that provides a reliable and \
    scalable database solution for storing and managing data."

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

# Replace two lines in mariadb config to allow remote connections through ports
RUN sed -i '/^# port =/c\port = 3306'  /etc/mysql/my.cnf && \
    sed -i '/^socket =/c\# socket ='  /etc/mysql/my.cnf && \
    # This will allow mariadb to listen on remote connections not just localhost
    sed -i '/^bind-address/c\bind-address = 0.0.0.0'   /etc/mysql/mariadb.conf.d/50-server.cnf

# Start and initialize mariadb
RUN service mariadb start && \
    # Create database
    mariadb -u root -e "CREATE DATABASE IF NOT EXISTS ${DB_NAME};FLUSH PRIVILEGES; \
        # Create Wordpress user
        CREATE USER IF NOT EXISTS '${DB_USER_NAME}'@'%' IDENTIFIED BY '${DB_USER_PASS}';FLUSH PRIVILEGES; \
        # Create Wordpress admin
        CREATE USER IF NOT EXISTS '${ADMIN_NAME}'@'%' IDENTIFIED BY '${ADMIN_PASS}';FLUSH PRIVILEGES; \
        # Give wordpress admin admin privilidges
        GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${ADMIN_NAME}'@'%' IDENTIFIED BY '${ADMIN_PASS}' WITH GRANT OPTION;FLUSH PRIVILEGES; \
        # Make root accessible outside of localhost
        CREATE USER 'root'@'%' IDENTIFIED BY '${ROOT_PASS}'; GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;"

# Run mariadb when container starts
CMD ["/bin/bash", "-c", "mysqld_safe"]
