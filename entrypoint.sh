#!/bin/bash
cd /home/container

# Used for subscribing to betas or for testing
if [ -z "$STEAMCMD_UPDATE_ARGS" ]; then
	./steamcmd/steamcmd.sh +login anonymous +force_install_dir /home/container +app_update "$STEAMAPPID" +quit
else
	steamcmd_update_args=($STEAMCMD_UPDATE_ARGS)
	./steamcmd/steamcmd.sh +login anonymous +force_install_dir /home/container +app_update "$STEAMAPPID" "${steamcmd_update_args[@]}" +quit
fi

# Replace Startup Variables
MODIFIED_STARTUP=`eval echo $(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')`
echo ":/home/container$ ${MODIFIED_STARTUP}"

# Run the Server
${MODIFIED_STARTUP}