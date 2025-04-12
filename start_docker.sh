#!/bin/bash

# Wrapper script to add mixin mods and then call docker based on docker-compose.yaml and then background it. Requires execution with sudo

# Export variables from definitions file
source definitions

# Download modpack using curl
if [ ! -f "${OUTPUT_FILE}" ]; then
  echo Downloading "${MODPACK_DOWNLOAD_LINK}"
  curl -L "${MODPACK_DOWNLOAD_LINK}" --output "${OUTPUT_FILE}" || (rm "${OUTPUT_FILE}"; echo "Failed to download modpack!"; exit 1)
fi

# Add mix-ins from /modpack/mods/*.jar to modpack.zip if curseforge
if [ "${TYPE}" = "CURSEFORGE" ]; then
  (cd modpack; 7z a modpack.zip mods/*.jar) || (echo "Failed to add mix-ins!"; exit 1)
fi

# Launch docker
echo "Starting docker!" && docker compose up -d

