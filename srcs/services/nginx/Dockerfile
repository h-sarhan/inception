FROM debian:buster

LABEL author.name="Hassan Sarhan"
LABEL author.email="hassanAsarhan@outlook.com"
LABEL author.intra="hsarhan"

# Update package lists and install nginx
RUN apt-get update && apt-get install nginx -y

# Copy nginx config file to container
COPY ./nginx.conf /etc/nginx/sites-available/default

# Expose port 443 the container will listen on
EXPOSE 443/tcp

# Run nginx when container starts
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
