FROM debian:buster

# Setting labels
LABEL author.name="Hassan Sarhan"
LABEL author.email="hassanAsarhan@outlook.com"
LABEL author.intra="hsarhan"
LABEL description="A Docker container that builds an Nginx server, \
    which is a high-performance web server and reverse proxy server that \
    can handle heavy traffic loads and serve as a load balancer for other servers."

# Update package lists and install nginx
RUN apt-get update && \
    apt-get install nginx -y

# Get SSL certs and key from .env
ARG SSL_KEY
ARG SSL_CERT

# Copying over SSL key and SSL certificates
RUN mkdir /certs && \
    echo "${SSL_KEY}" > /certs/ssl.key && \
    echo "${SSL_CERT}" > /certs/ssl.cert

# Copy nginx config file to container
COPY ./server.conf /etc/nginx/sites-available/server.conf

# Creating directories for wordpress and static website and setting the
# correct permissions and ownership for them
RUN mkdir -p /var/www/html/wordpress && \
    mkdir -p /var/www/html/inception && \
    chmod -R 0755 /var/www/html && \
    chown -R www-data:www-data /var/www/html && \
    ln -s /etc/nginx/sites-available/server.conf /etc/nginx/sites-enabled/

# Run nginx when container starts
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
