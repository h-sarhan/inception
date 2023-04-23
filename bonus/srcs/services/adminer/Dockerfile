FROM debian:buster

# Setting labels
LABEL author.name="Hassan Sarhan"
LABEL author.email="hassanAsarhan@outlook.com"
LABEL author.intra="hsarhan"

RUN apt-get update && \
    apt-get install -y apache2 php php-curl libapache2-mod-php \
        php-cli php-mysql php-gd php-fpm adminer && \
    a2enconf php*-fpm && \
    a2enconf adminer

    





CMD ["/bin/bash", "-c", "sleep infinity"]