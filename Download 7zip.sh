#!/bin/bash

set -euo pipefail

if ! command -v p7zip &> /dev/null; then
    sudo apt update
    sudo apt install p7zip -y
else
    echo "7Zip est déjà installé"
fi