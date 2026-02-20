#!/bin/bash
set -euo pipefail

if [ "$EUID" -ne 0 ]; then
  echo "Ce script doit être exécuté en tant que root (sudo)."
  echo "Script terminé."
  exit 1
fi

if ! command -v google-chrome-stable &> /dev/null; then
    echo "Google Chrome n'est pas installé. Installation en cours..."
else
    echo "Google Chrome est déjà installé"
    exit 0
fi

echo "Mise à jour des dépôts..."
apt update -y

echo "Installation de wget si absent..."
apt install -y wget

if dpkg -l | grep -q google-chrome-stable; then
    echo "Google Chrome est déjà installé."
else

    if ! grep -q "dl.google.com/linux/chrome/deb" /etc/apt/sources.list /etc/apt/sources.list.d/* 2>/dev/null; then
    echo "Ajout du dépôt Google Chrome..."
    sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list'
    apt update -y
    else

    echo "Téléchargement et installation de Google Chrome..."

    wget -O /tmp/google-chrome-stable_current_amd64.deb \
         https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

    dpkg -i /tmp/google-chrome-stable_current_amd64.deb || true

    apt install -y -f

    echo "Installation terminée."
    fi
fi