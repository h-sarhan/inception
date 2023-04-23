ngrok tcp 25565 --log=stdout >/dev/null &
cd /opt/minecraft && java -Xms2048M -Xmx2048M -jar minecraft_server.jar nogui