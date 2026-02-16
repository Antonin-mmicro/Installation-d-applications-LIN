#!/bin/bash

set -euo pipefail

# Vérifier que le script est exécuté en root
if [ "$EUID" -ne 0 ]; then
  echo "Ce script doit être exécuté en tant que root (sudo)."
  echo "Script terminé."
  exit 1
fi

# Vérifier si snap est installé
if ! command -v snap >/dev/null 2>&1; then
    echo "snap n'est pas installé. Installation en cours..."
    apt update
    apt install -y snapd
else
    echo "snap est déjà installé"
fi

# Vérifier si Firefox est installé via snap
if snap list firefox >/dev/null 2>&1; then
    echo "Mozilla Firefox est déjà installé via snap."
    echo "Mise à jour de Firefox..."
    snap refresh firefox
else
    echo "Mozilla Firefox n'est pas installé via snap."
    echo "Installation de Firefox..."
    snap install firefox
fi

# Vérification finale
if command -v firefox >/dev/null 2>&1; then
    echo "Installation / mise à jour de Firefox terminée avec succès."
    exit 0
else
    echo "L'installation a échoué."
    exit 1
fi
