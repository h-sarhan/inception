FROM debian:buster

# Setting labels
LABEL author.name="Hassan Sarhan"
LABEL author.email="hassanAsarhan@outlook.com"
LABEL author.intra="hsarhan"

RUN apt update && \
    apt install curl -y && \
    curl -s https://ngrok-agent.s3.amazonaws.com/ngrok.asc | \
    tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null && \
    echo "deb https://ngrok-agent.s3.amazonaws.com buster main" | \
    tee /etc/apt/sources.list.d/ngrok.list && \
    apt update && \
    apt install -y \
    ngrok \
    python3 && \
    mkdir ngrok-rocks && \
    cd ngrok-rocks && \
    echo '<img src="./mpatel.jpeg"/>' > index.html
#   python3 -m http.server


COPY ./mpatel.jpeg ./ngrok-rocks/mpatel.jpeg

