#!/bin/bash

# Vérification des droits root
if [ "$EUID" -ne 0 ]; then
  echo "Ce script doit être exécuté en tant que root (sudo)."
  echo "Script terminé."
  exit 1
fi

# Récupération de la dernière version officielle
LATEST=$(curl -s https://product-details.mozilla.org/1.0/firefox_versions.json | grep LATEST_FIREFOX_VERSION | cut -d '"' -f4)

# Vérification si Firefox est installé
if command -v firefox >/dev/null 2>&1; then
    ACTUAL=$(firefox --version | awk '{print $3}')
    
    if [ "$ACTUAL" = "$LATEST" ]; then
        echo "Mozilla Firefox est déjà installé et à jour."
        exit 0
    else
        echo "Mozilla Firefox est installé mais pas à jour."
        echo "Version actuelle : $ACTUAL"
        echo "Dernière version : $LATEST"
        echo "Mise à jour en cours..."
    fi
else
    echo "Mozilla Firefox n'est pas installé."
    echo "Installation en cours..."
fi

# Mise à jour des dépôts
apt update

# Installation / mise à jour
apt install -y firefox

if command -v firefox >/dev/null 2>&1; then
    echo "Installation / Mise à jour terminée avec succès."
    exit 0
else
    echo "L'installation a échoué."
    exit 1
fi