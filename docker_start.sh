#!/bin/bash

# Wrapper script to add mixin mods and then call docker based on docker-compose.yaml and then background it. Requires execution with sudo

# Add mix-ins from /modpack/mods/*.jar to modpack.zip
cd modpacks
7z a modpack.zip mods/*.jar
cd ..

# Launch docker in interactive mode so it can be attached at a later date using docker attach [name]

docker compose up -d

