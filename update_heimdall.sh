#!/bin/bash

# Stop and remove the Heimdall container if it's running
if [ "$(docker ps -q -f name=heimdall)" ]; then
    echo "Stopping and removing existing Heimdall container..."
    docker stop heimdall && docker rm heimdall
fi

# Remove the Heimdall image if it exists
if [ "$(docker images -q linuxserver/heimdall)" ]; then
    echo "Removing existing Heimdall image..."
    docker rmi linuxserver/heimdall
fi

# Update docker to get the latest images
echo "Updating Docker images..."
docker system prune -a -f

# Pull the latest Heimdall image
echo "Pulling latest Heimdall image..."
docker pull linuxserver/heimdall

# Run the Heimdall container
echo "Starting new Heimdall container..."
docker run -d --name=heimdall -e PUID=1000 -e PGID=1000 -e TZ=Europe/London -p 8080:80 -p 8443:443 -v /etc/heimdall/config:/config --restart unless-stopped linuxserver/heimdall

echo "Heimdall update process completed!"

