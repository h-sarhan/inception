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
COPY ./nginx.conf /etc/nginx/sites-available/default

# Run nginx when container starts
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]