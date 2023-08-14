#!/bin/sh
# original script by https://github.com/mtoensing/Docker-Minecraft-PaperMC-Server/blob/latest/docker-entrypoint.sh
set -e

DOCKER_USER='dockeruser'
DOCKER_GROUP='dockergroup'

if test -f "/app/server.properties"; then
  cp -f /app/server.properties /data/server.properties
fi

if test -d "/app/plugins"; then
  if test ! -d "/data/plugins"; then
    mkdir "/data/plugins"
  fi
  cp -f -r /app/plugins/* /data/plugins/
  grep -rl %%MC-WORLD-DB%% /data/plugins | xargs -r sed -i "s/%%MC-WORLD-DB%%/$DATABASE_NAME/g"
fi

if test -d "/app/config"; then
  cp -f -r /app/config /data/config
  #grep -rl %%MC-WORLD-DB%% /data/config | xargs sed -i "s/%%MC-WORLD-DB%%/$DATABASE_NAME/g"
fi

if ! id "$DOCKER_USER" >/dev/null 2>&1; then
    echo "First start of the docker container, start initialization process."

    USER_ID=${PUID:-9001}
    GROUP_ID=${PGID:-9001}
    echo "Starting with $USER_ID:$GROUP_ID (UID:GID)"

    addgroup --gid $GROUP_ID $DOCKER_GROUP
    adduser $DOCKER_USER --shell /bin/sh --uid $USER_ID --ingroup $DOCKER_GROUP --disabled-password --gecos ""

    chown -vR $USER_ID:$GROUP_ID /app/minecraft
    chmod -vR ug+rwx /app/minecraft

    if [ "$SKIP_PERM_CHECK" != "true" ]
    then
        chown -vR $USER_ID:$GROUP_ID /data
    fi
fi

export HOME=/home/$DOCKER_USER
exec gosu $DOCKER_USER:$DOCKER_GROUP java -jar -Xms$MEMORYSIZE -Xmx$MEMORYSIZE $JAVAFLAGS /app/minecraft/papermc.jar $PAPERMC_FLAGS --nogui --universe universe

