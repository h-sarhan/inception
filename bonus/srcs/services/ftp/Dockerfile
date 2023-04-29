FROM debian:buster

# Setting labels
LABEL author.name="Hassan Sarhan"
LABEL author.email="hassanAsarhan@outlook.com"
LABEL author.intra="hsarhan"
LABEL description="An FTP server Docker image that allows users to \
    transfer files over a network using the File Transfer Protocol (FTP)."

# Installing python3 and a python ftp module
RUN apt update && \
    apt install -y python3 vim python3-pip && \
    pip3 install pyftpdlib

# Copying a script that starts a minimal FTP server using a python ftp module
COPY ./ftp.py .

# Go to directory we want to serve and start the FTP server
CMD ["/bin/bash", "-c", "cd /var/www/html/wordpress && python3 /ftp.py"]