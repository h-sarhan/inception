# Route tcp connections on port 25565 to ngrok this will also run ngrok in the background
ngrok tcp 25565 --log=stdout >/dev/null &
# Run the minecraft server with java
cd /opt/minecraft && java -Xms1024M -Xmx1024M -jar minecraft_server.jar nogui