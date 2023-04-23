FROM debian:buster

# Setting labels
LABEL author.name="Hassan Sarhan"
LABEL author.email="hassanAsarhan@outlook.com"
LABEL author.intra="hsarhan"

RUN apt-get update && \
    apt-get install -y apt-transport-https lsb-release ca-certificates wget curl software-properties-common gnupg2 && \
    wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg && \
    echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list && \
    apt-get update && \
    apt-get install -y php8.0-fpm php8.0-bcmath php8.0-cli php8.0-cgi php8.0-common php8.0-curl \
    php8.0-dev php8.0-gd php8.0-imap php8.0-imagick php8.0-intl php8.0-mbstring php8.0-mcrypt \
    php8.0-mysql php8.0-opcache php8.0-soap php8.0-xml php8.0-xmlrpc php8.0-zip

# Installing mariadb-client
RUN curl -LsS -O https://downloads.mariadb.com/MariaDB/mariadb_repo_setup && \
    bash mariadb_repo_setup && \
    apt-get update -y && \
    apt-get -y install mariadb-client


RUN mkdir -p /var/www/html/wordpress && \
    mkdir -p /run/php

# Replace line in php-fpm config so that it listens on port 9000
RUN sed -i '/^listen = /c\listen = wordpress:9000'  /etc/php/8.0/fpm/pool.d/www.conf

EXPOSE 9000

COPY ./wp_install.sh .

CMD [ "/bin/bash", "-c", "/bin/bash ./wp_install.sh && php-fpm8.0 -F" ]
