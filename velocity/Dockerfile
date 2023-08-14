############################ RUNTIME ############################
FROM eclipse-temurin:20-jre

ARG TARGETARCH
# Install gosu, curl
RUN set -eux && apt update -y && apt install -y gosu curl net-tools && rm -rf /var/lib/apt/lists/* && gosu nobody true

WORKDIR /app

COPY velocity-3.2.0-SNAPSHOT-261.jar /app/velocity.jar
COPY default-velocity.toml /app/velocity.toml
COPY plugins /app/plugins
COPY forwarding.secret /app
COPY entrypoint.sh /app
RUN chmod +x /app/entrypoint.sh

ENTRYPOINT ["/app/entrypoint.sh"]
