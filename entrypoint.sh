#!/bin/bash

# If no instance folder exists, run setup
if [ ! -d "/home/redbot/data/instances/main" ]; then
    echo "Running redbot-setup for the first time..."
    echo -e "main\n\njson\n\n!\n" | redbot-setup
fi

# Start Red-Bot
redbot main
