#!/bin/bash

# Ensure variables are set if not use defaults
first_run=true
PZ_SERVER_NAME="${PZ_SERVER_NAME:=server}"
PZ_ADMIN_PASSWORD="${PZ_ADMIN_PASSWORD:=pzserverAdmin!}"


# If game server has been setup once "server-console.txt" will exist else db needs creating
if [ -f "/home/pzserver/Zomboid/server-console.txt" ] 
then
    first_run=false
fi

cd /opt/pzserver

if [ $first_run == "true" ]; then
    printf "$PZ_ADMIN_PASSWORD\n$PZ_ADMIN_PASSWORD" | ./start-server.sh -servername $PZ_SERVER_NAME
else
    ./start-server.sh -servername $PZ_SERVER_NAME
fi