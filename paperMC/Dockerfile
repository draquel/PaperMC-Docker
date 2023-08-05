############################ RUNTIME ############################
FROM eclipse-temurin:20-jre as runtime

ARG TARGETARCH
# Install gosu, curl & jq
RUN set -eux && apt update -y && apt install -y gosu curl jq && rm -rf /var/lib/apt/lists/* && gosu nobody true

ARG VERSION=1.20.1

WORKDIR /app/minecraft
COPY /getpaper.sh /app/minecraft
RUN chmod +x /app/minecraft/getpaper.sh
RUN /app/minecraft/getpaper.sh ${VERSION}

# Expose minecraft port
EXPOSE 25565/tcp
EXPOSE 25565/udp

# Expose RCON port
EXPOSE 25575/tcp
EXPOSE 25575/udp

# Expose floodgate port
EXPOSE 19132/tcp
EXPOSE 19132/udp

ARG MEMORY_SIZE=2G
ENV MEMORYSIZE=$MEMORY_SIZE

ARG JAVAFLAGS="-Dlog4j2.formatMsgNoLookups=true -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M -XX:G1ReservePercent=20 -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 -Dusing.aikars.flags=mcflags.emc.gs -Dcom.mojang.eula.agree=true"
ENV JAVAFLAGS=$JAVAFLAGS

ARG PAPERMCFLAGS
ENV PAPERMC_FLAGS=$PAPERMCFLAGS

VOLUME "/data"
WORKDIR /data

COPY /plugins /data/plugins
COPY /server.properties /data
RUN echo "eula=true" > eula.txt

ARG OP_ID
ARG OP_NAME
RUN echo "[{\"uuid\": \"$OP_ID\",\"name\": \"$OP_NAME\",\"level\": 4,\"bypassesPlayerLimit\": true}]" > ops.json


COPY /entrypoint.sh /app/minecraft
RUN chmod +x /app/minecraft/entrypoint.sh
ENTRYPOINT ["/app/minecraft/entrypoint.sh"]
