############################ RUNTIME ############################
FROM eclipse-temurin:20-jre

ARG TARGETARCH
# Install gosu, mysql-client, curl & jq
RUN set -eux && apt update -y && apt install -y gosu curl jq mysql-client net-tools && rm -rf /var/lib/apt/lists/* && gosu nobody true

#Install mcrcon
ARG MCRCON_VER=0.7.2
ADD https://github.com/Tiiffi/mcrcon/releases/download/v${MCRCON_VER}/mcrcon-${MCRCON_VER}-linux-x86-64.tar.gz /tmp/mcrcon.tgz
RUN tar -x -C /usr/local/bin -f /tmp/mcrcon.tgz mcrcon && rm /tmp/mcrcon.tgz

#SET ENV
ARG VERSION=1.20.1

ARG MEMORY_SIZE=2G
ENV MEMORYSIZE=$MEMORY_SIZE
ARG JAVAFLAGS="-Dlog4j2.formatMsgNoLookups=true -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M -XX:G1ReservePercent=20 -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 -Dusing.aikars.flags=mcflags.emc.gs -Dcom.mojang.eula.agree=true"
ENV JAVAFLAGS=$JAVAFLAGS
ARG PAPERMCFLAGS
ENV PAPERMC_FLAGS=$PAPERMCFLAGS
ARG SERVER_DB=mc_server
ENV DATABASE_NAME=$SERVER_DB
ARG OP_ID=NULL
ARG OP_NAME
ARG EULA=false

WORKDIR /app/minecraft

#Copy scripts and allow execute
COPY /entrypoint.sh /app/minecraft
COPY /getpaper.sh /app/minecraft
COPY /setperms.sh /app/minecraft
RUN chmod +x /app/minecraft/entrypoint.sh
RUN chmod +x /app/minecraft/getpaper.sh;
RUN chmod +x /app/minecraft/setperms.sh;

RUN /app/minecraft/getpaper.sh $VERSION

VOLUME "/data"
WORKDIR /data

#Accept EULA
RUN echo "eula=$EULA" > eula.txt

#Set Server Op
RUN if ["$OP_ID" != NULL]; then echo "[{\"uuid\": \"$OP_ID\",\"name\": \"$OP_NAME\",\"level\": 4,\"bypassesPlayerLimit\": true}]" > ops.json; else echo "No OP defined"; fi

# Expose minecraft port
EXPOSE 25565/tcp
EXPOSE 25565/udp

# Expose RCON port - NEEDS CHECK FOR ENABLED IN SERVER PROPERTIES
EXPOSE 25575/tcp
EXPOSE 25575/udp

# Expose Geyser port - NEEDS CHECK FOR PLUGIN
EXPOSE 19132/tcp
EXPOSE 19132/udp

ENTRYPOINT ["/app/minecraft/entrypoint.sh"]
