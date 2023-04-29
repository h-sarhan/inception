FROM debian:buster

# Setting labels
LABEL author.name="Hassan Sarhan"
LABEL author.email="hassanAsarhan@outlook.com"
LABEL author.intra="hsarhan"

# Update package lists and install nginx
RUN apt-get update && \
    apt-get install nginx -y

# Get arguments from .env
ARG SSL_KEY
ARG SSL_CERT

# Copying over SSL key and SSL certificates
RUN mkdir /certs && \
    echo "${SSL_KEY}" > /certs/ssl.key && \
    echo "${SSL_CERT}" > /certs/ssl.cert

# Copy nginx config file to container
COPY ./wordpress.conf /etc/nginx/sites-available/wordpress.conf

RUN mkdir -p /var/www/html/wordpress && \
    mkdir -p /var/www/html/inception && \
    chmod -R 0755 /var/www/html && \
    chown -R www-data:www-data /var/www/html && \
    ln -s /etc/nginx/sites-available/wordpress.conf /etc/nginx/sites-enabled/
    # ln -s /etc/nginx/sites-available/inception.conf /etc/nginx/sites-enabled/

# Run nginx when container starts
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
# CMD ["/bin/bash", "-c", "sleep infinity"]
