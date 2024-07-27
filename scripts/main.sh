#!/bin/bash

# copy .env into assistant and nlp_server
cp .env assistant/.env
cp .env nlp_server/.env

# if users.json exists, copy it into nlp_server/, else create it by copying example.users.json into nlp_server/ as users.json
if [ -f users.json ]; then
    cp users.json nlp_server/users.json
else
    cp example.users.json nlp_server/users.json
fi

# Start the first process
./assistant.sh &

# Start the second process
./nlp_server.sh &

# Start the third process
# ./vision_server.sh

# Wait for any process to exit
wait -n

# Exit with status of process that exited first
exit $?