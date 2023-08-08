# PaperMC Docker Container

This project is dedicated to creating a container to easily create a paperMC server ready to join. The project does not include any server mods, however, it does 
contain some mod specific features. The mysql container was added to act as a backend for some of the more data driven server mods like [LuckPerms](https://github.com/LuckPerms/LuckPerms), [WorldGuard](https://github.com/EngineHub/WorldGuard) and [CoreProtect](https://github.com/PlayPro/CoreProtect/). More details about how 
to use these features can be found in the Plugins section.

[PaperMC](https://github.com/PaperMC/Paper)

## Requirements
   Docker Daemon / Docker Desktop installed, git.

## Install

### 1. Clone the repo
```
git clone https://github.com/draquel/PaperMC-Docker.git
```
### 2. Create `.env` file
```
cd PaperMC-Docker && cp sample.env .env
```
- Update the DATABASE_HOST var in `.env` to point to your docker host, eg: host.docker.internal
- **Optional:** To set a server OP add the UUID and username to the `OP_ID` and `OP_NAME` in `.env` and uncomment those two lines in `docker-compose.yml`.

### 3. Create and Start Containers
```
docker compose up
```
**OR** if you want to start detached:
```
docker compose create && docker compose start
```

### 4. Connect!

#### Minecraft
From the Menu select "Multiplayer". Then Click the "Add Server" button and enter any Server Name you like. Then set the Server Address to your Docker Host Name/IP and the default minecraft port.
```
localhost:25565
host.docker.internal:25565
192.168.1.25:25565
```
Press "Done" and you will see the new server you created in your list. Click on the server in the list and press "Join Server".

#### RCON
You can connect to the server console remotely using an RCON cli like [mcrcon](https://github.com/Tiiffi/mcrcon)
```   
mcrcon -H localhost -P 25575 -p mypassword -t
```
The password is configured in the server.properties file as `rcon.password`. 
## Plugins


### General details
   Plugin jar files should be placed into the papermc/plugins directory just like if you ran the server locally. If you want to include custom configurations you can create a mock folder
structure for the plugin and include your modified config file. The entire plugins directory will be copied into the container at build time. Addtionally these files are checked for database 
   related placeholders to be able to dynamically assign database information, details about this are coming.

### LuckPerms

   The default database created in the mysql instance is for luckperms. Each instance of the server will try to create its own database for intance specific plugin data.

## Database
   The included configuration for mysql is for convenience sake. Any external mysql database could be used with the server container and many mods support other database types. MYSQL is just
very popular.
