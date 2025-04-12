#!/usr/bin/env bash

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
echo "Entered '${SCRIPT_DIR}'"
cd ${SCRIPT_DIR}
./man_server restart
