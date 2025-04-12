#!/bin/bash

# Wrapper script to add mixin mods and then call docker based on docker-compose.yaml and then background it. Requires execution with sudo

# Export variables from definitions file
source definitions

MODPACK_FOLDER=modpacks

# Download modrinth file to modrinth.mrpack for quick deployment
if [ "${TYPE}" = "MODRINTH" ]; then 
  OUTPUT_FILE="${MODPACK_FOLDER}/modrinth.mrpack"
elif [ "${TYPE}" = "CURSEFORGE" ]; then
  OUTPUT_FILE="${MODPACK_FOLDER}/modpack.zip"
fi
# Create correct define for docker container path
DOCKER_MODPACK_LOCATION="/${OUTPUT_FILE}"
export DOCKER_MODPACK_LOCATION

# Download modpack using curl
if [ ! -f "${OUTPUT_FILE}" ]; then
  echo Downloading "${MODPACK_DOWNLOAD_LINK}"
  curl -L "${MODPACK_DOWNLOAD_LINK}" --output "${OUTPUT_FILE}" || rm "${OUTPUT_FILE}" && echo "Failed to download modpack!" && exit 1
fi

# Add mix-ins from /modpack/mods/*.jar to modpack.zip if curseforge
if [ "${TYPE}" = "CURSEFORGE" ]; then
  cd modpacks && 7z a modpack.zip mods/*.jar && cd .. || echo "Failed to add mix-ins!" && exit 1
fi

# Launch docker in interactive mode so it can be attached at a later date using docker attach [name]
docker compose up -d

