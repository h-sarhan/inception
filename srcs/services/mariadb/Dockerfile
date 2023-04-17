FROM alpine:3.16

LABEL author.name="Hassan Sarhan"
LABEL author.email="hassanAsarhan@outlook.com"
LABEL author.intra="hsarhan"

# Update package lists and install mariadb
RUN apk update \
    && apk add openrc mariadb mariadb-common mariadb-client

COPY ./setup.sh .

# Get arguments from .env
ARG DB_NAME
ARG ROOT_PASS
ARG DB_USER
ARG USER_PASS

# RUN ["/bin/sh", "/setup.sh"]
RUN openrc && \
    touch /run/openrc/softlevel && \
    rc-service mariadb setup && \
    rc-service mariadb start && \
    mariadb -u root -e "CREATE DATABASE ${DB_NAME};"

COPY ./setup.sh .

CMD ["/bin/sh", "./setup.sh"]
