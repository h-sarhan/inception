FROM debian:buster

# Setting labels
LABEL author.name="Hassan Sarhan"
LABEL author.email="hassanAsarhan@outlook.com"
LABEL author.intra="hsarhan"
LABEL description="A Docker container that builds a WordPress server, which is\
    a popular content management system used to create and manage websites and \
    blogs, providing a flexible and user-friendly platform for web development and publishing."

# Installing PHP dependencies of wordpress
RUN apt-get update && \
    apt-get install -y apt-transport-https lsb-release ca-certificates wget curl software-properties-common gnupg2 unzip && \
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
    apt-get -y install mariadb-client wget

# Creating directories for wordpress and the static website
RUN mkdir -p /var/www/html/wordpress && \
    mkdir -p /var/www/html/inception && \
    mkdir -p /run/php && \
    # Installing the wordpress cli
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp && \
    # Downloading wordpress into the volume
    wp core download --path="/var/www/html/wordpress" --allow-root && \
    # Installing adminer
    mkdir -p /var/www/html/adminer && \
    wget "http://www.adminer.org/latest.php" -O /var/www/html/adminer/adminer.php && \
    # Change ownership and permissions of wordpress files
    chmod -R 0755 /var/www/html/ && \
    chown -R www-data:www-data /var/www/html/

# Replace line in php-fpm config so that it listens on port 9000
RUN sed -i '/^listen = /c\listen = wordpress:9000'  /etc/php/8.0/fpm/pool.d/www.conf

# Copy wordpress config
COPY ./wp-config.php /var/www/html/wordpress/wp-config.php

# Copy static website
COPY inception_website /inception

# Expose port 9000
EXPOSE 9000

# Copy wordpress local install script
COPY ./wp_install.sh .

# Run wordpress local install script and start php fastcgi processor
CMD [ "/bin/bash", "-c", "/bin/bash ./wp_install.sh && php-fpm8.0 -F" ]
