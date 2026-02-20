#!/bin/bash

set -euo pipefail

if [ "$EUID" -ne 0 ]; then
  echo "Ce script doit être exécuté en tant que root (sudo)."
  echo "Script terminé."
  exit 1
fi

if ! command -v p7zip &> /dev/null; then
    sudo apt update
    sudo apt install p7zip -y
else
    echo "7Zip est déjà installé"
fi