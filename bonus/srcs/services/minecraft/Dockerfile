FROM debian:buster

# Setting labels
LABEL author.name="Hassan Sarhan"
LABEL author.email="hassanAsarhan@outlook.com"
LABEL author.intra="hsarhan"
LABEL description="A Docker container that builds a Minecraft server, allowing \
    users to create and run their own Minecraft game worlds on a dedicated server. \
    This container also uses ngrok to make the minecraft server available worldwide."

# Update package lists install JDK version 17 and sets the appropriate environmental variables
RUN apt-get update && \
    apt-get -y install wget apt-transport-https sudo && \
    wget -O - https://packages.adoptium.net/artifactory/api/gpg/key/public | \
        tee /usr/share/keyrings/adoptium.asc && \
    echo "deb [signed-by=/usr/share/keyrings/adoptium.asc] https://packages.adoptium.net/artifactory/deb $(awk -F= '/^VERSION_CODENAME/{print$2}' /etc/os-release) main" | \
        tee /etc/apt/sources.list.d/adoptium.list && \
    apt-get update && \
    apt-get install -y temurin-17-jdk && \
    echo "export JAVA_HOME=$(readlink -f /usr/bin/java | sed "s:bin/java::")" | \
        tee -a /etc/profile && \
    echo "export PATH=$PATH:$JAVA_HOME/bin" | \
        tee -a /etc/profile

# Create user that will start and own the minecraft server
RUN useradd -ms /bin/bash steve && \
    mkdir /opt/minecraft && \
    sudo chown steve:steve /opt/minecraft

# Download minecraft server and accespt the terms and conditions
RUN cd /opt/minecraft && \
    wget https://piston-data.mojang.com/v1/objects/8f3112a1049751cc472ec13e397eade5336ca7ae/server.jar -O minecraft_server.jar && \
    echo "eula=true" > /opt/minecraft/eula.txt

# Downlaod and install ngrok
RUN apt install -y curl && curl -s https://ngrok-agent.s3.amazonaws.com/ngrok.asc | \
        tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null && \
    echo "deb https://ngrok-agent.s3.amazonaws.com buster main" | \
        tee /etc/apt/sources.list.d/ngrok.list && \
    apt-get update && \
    apt-get -y install ngrok

# Switch to steve user
USER steve

# Use ngrok authentication token from .env file
ARG NGROK_AUTH

# Make ngrok use auth token from .env file
RUN ngrok config add-authtoken ${NGROK_AUTH}

# Copy setup script
COPY ./start.sh .

# Run setup script
CMD [ "/bin/bash", "-c", "/bin/bash ./start.sh" ]
