#!/bin/sh
# Pull latest version of the image
docker pull koch64/first_nginx_image
# Stop the container
docker stop project5
# Remove the container
docker rm project5

docker image prune -f
# Recreate the container
docker run -p 80:80 -d --name project5 koch64/first_nginx_image
