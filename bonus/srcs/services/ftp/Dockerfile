FROM debian:buster

# Setting labels
LABEL author.name="Hassan Sarhan"
LABEL author.email="hassanAsarhan@outlook.com"
LABEL author.intra="hsarhan"

RUN apt update && \
    apt install -y python3 vim python3-pip && \
    pip3 install pyftpdlib

COPY ./ftp.py .

CMD ["/bin/bash", "-c", "cd /var/www/html/wordpress && python3 /ftp.py"]