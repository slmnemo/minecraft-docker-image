### Instructions
Use script `get_modpack.sh `to download the modpack from a URL under `./modpacks/modpack.zip`. 

Once that is done, run the script `docker_start.sh` to run the server based on the docker-compose.yml parameters.

You may need to configure the docker-compose.yml paramters to get it to work correctly.

## Advanced instructions

The server\_manager.sh script can be used to `install`, `start`, `restart`, or `stop` the server by passing the appropriate keyword after invoking the script. 

Restarting an existing server can be automated using the scheduled\_restart.sh script and crontab.
