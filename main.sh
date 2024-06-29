#!/bin/bash

# Start the first process
./assistant.sh &

# Start the second process
./nlp_server.sh &

# Start the third process
./vision_server.sh

# Wait for any process to exit
wait -n

# Exit with status of process that exited first
exit $?