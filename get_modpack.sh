#!/bin/bash

# Variables for installation and modpack file location. DO NOT CHANGE NAME OF modpack.zip WITHOUT CHANGING docker-compose.yml ACCORDINGLY!

zip="./modpacks/modpack.zip"
URL="" # Add modpack URL here

# Delete previous modpack.zip if it exists
if test -f "$zip"; then
    echo "Deleting previous modpack file"
    rm $zip
fi

# Use curl to get URL and store it into ./modpacks/modpack.zip
echo Downloading $URL
curl -L $URL --output "$zip"
