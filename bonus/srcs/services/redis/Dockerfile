FROM debian:buster

# Setting labels
LABEL author.name="Hassan Sarhan"
LABEL author.email="hassanAsarhan@outlook.com"
LABEL author.intra="hsarhan"
LABEL description="A Docker container that builds a Redis server, which is a \
    popular open-source in-memory data structure store used as a database, \
    cache, and message broker."

# Updating package lists and installing redis
RUN apt-get update && \
    apt-get install -y redis-server php-redis wget && \
    echo "maxmemory 256mb" >>  /etc/redis/redis.conf && \
    echo "maxmemory-policy allkeys-lru" >>  /etc/redis/redis.conf

# Running the redis server
CMD ["/bin/bash", "-c", "redis-server --protected-mode no"]