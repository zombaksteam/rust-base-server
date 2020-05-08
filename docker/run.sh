#!/bin/bash

# Move to server root
cd /home/steam/rust

# Make dir for binding
mkdir /home/steam/rust/server
mkdir /home/steam/rust/server/rust
mkdir /home/steam/rust/server/rust/cfg

# Need for rust server
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:`dirname $0`/RustDedicated_Data/Plugins/x86_64

# Add admin to file
if [[ ${ADMIN_STEAMID} != "" ]]; then
	UFILE="/home/steam/rust/server/rust/cfg/users.cfg"
	echo "ownerid ${ADMIN_STEAMID} \"${ADMIN_NAME}\" \"no reason\"" > ${UFILE}
	echo "" >> ${UFILE}
fi

# Server run command
RUN_CMD="./RustDedicated -batchmode -nographics"
if [[ ${SERVER_LEVEL} != "" ]]; then
	RUN_CMD="${RUN_CMD} +server.level \"${SERVER_LEVEL}\""
fi
if [[ ${SERVER_LEVEL_URL} != "" ]]; then
	RUN_CMD="${RUN_CMD} +server.levelurl \"${SERVER_LEVEL_URL}\""
fi
RUN_CMD="${RUN_CMD} +server.identity \"rust\""
RUN_CMD="${RUN_CMD} +server.hostname \"${SERVER_HOSTNAME}\""
RUN_CMD="${RUN_CMD} +server.ip ${SERVER_HOST_IP}"
RUN_CMD="${RUN_CMD} +server.port ${SERVER_HOST_PORT}"
RUN_CMD="${RUN_CMD} +rcon.ip ${SERVER_RCON_IP}"
RUN_CMD="${RUN_CMD} +rcon.port ${SERVER_RCON_PORT}"
RUN_CMD="${RUN_CMD} +rcon.password \"${SERVER_RCON_PASS}\""
RUN_CMD="${RUN_CMD} +server.worldsize ${SERVER_WORLD_SIZE}"
RUN_CMD="${RUN_CMD} +server.seed ${SERVER_SEED}"
RUN_CMD="${RUN_CMD} +rcon.web 1"

# Start server
${RUN_CMD} 2>&1 | tee /home/steam/rust/gamelog.txt
