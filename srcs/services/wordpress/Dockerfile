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

# Wordpress CLI setup
# RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
#     chmod +x wp-cli.phar && \
#     mv wp-cli.phar /usr/local/bin/wp && \
#     cd /var/www/html/wordpress && \
#     wp core download  --path="/var/www/html/wordpress" --allow-root && \
#     wp config create --path="/var/www/html/wordpress" --allow-root --dbname=wordpress --dbuser=bigboi --dbpass=ligma --dbhost=mariadb:3306
    #  && \
    # wp core install --path="/var/www/html/wordpress" --allow-root --url=$DOMAIN_NAME --title="$WP_SITE_TITLE" --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL && \
    # wp plugin update --allow-root --all && \
    # wp user create --path="/var/www/html/wordpress" --allow-root $WP_USER $WP_USER_EMAIL --user_pass=$WP_USER_PASSWORD && \
    # chown www-data:www-data /var/www/html/wordpress/wp-content/uploads -R



CMD [ "php-fpm8.0", "-F" ]
