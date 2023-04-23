FROM debian:buster

# Setting labels
LABEL author.name="Hassan Sarhan"
LABEL author.email="hassanAsarhan@outlook.com"
LABEL author.intra="hsarhan"

RUN apt-get update && \
    apt-get install -y redis-server php-redis wget && \
    echo "maxmemory 256mb" >>  /etc/redis/redis.conf && \
    echo "maxmemory-policy allkeys-lru" >>  /etc/redis/redis.conf

CMD ["/bin/bash", "-c", "redis-server --protected-mode no"]