#!/bin/bash

docker exec -it lobby-server /app/minecraft/setperms.sh $1 $2
