#!/bin/bash

IMAGES=$(docker-compose images -q)
docker-compose rm --force
docker rmi $IMAGES

docker network prune --force
docker volume prune --force
