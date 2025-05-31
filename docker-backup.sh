#!/bin/bash

# Stop running containers
docker stop $(docker ps -aq)

# Backup Docker volumes
volumes=$(docker volume ls --format '{{.Name}}')
backup_location="/media/csi/heartbeat/docker"

for volume in $volumes; do
  sudo cp -r /var/lib/docker/volumes/"$volume" "$backup_location"/volumes/"$volume"
done

# Export container configurations
containers=$(docker ps -aq --format '{{.Names}}')

for container in $containers; do
  docker export "$container" > "$backup_location"/containers/"$container".tar
done

# Backup Docker images
images=$(docker images --format '{{.Repository}}:{{.Tag}}')

for image in $images; do
  docker save "$image" -o "$backup_location"/images/"$image".tar
done

# Start containers
docker start $(docker ps -aq)

echo "Backup completed successfully."
