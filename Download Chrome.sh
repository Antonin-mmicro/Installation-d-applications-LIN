#!/bin/bash
set -euo pipefail

# Mettre à jour les paquets
echo "Mise à jour des dépôts..."
apt update -y

# Installer wget si nécessaire
echo "Installation de wget si absent..."
apt install -y wget

# Vérifier si Google Chrome est déjà installé
if dpkg -l | grep -q google-chrome-stable; then
    echo "Google Chrome est déjà installé."
else
    echo "Téléchargement et installation de Google Chrome..."
    
    # Télécharger le paquet .deb
    wget -O /tmp/google-chrome-stable_current_amd64.deb \
         https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

    # Installer le paquet
    dpkg -i /tmp/google-chrome-stable_current_amd64.deb || true

    # Corriger les dépendances manquantes
    apt install -y -f

    echo "Installation terminée."
fi

# Ajouter le dépôt Google Chrome si absent
if ! grep -q "dl.google.com/linux/chrome/deb" /etc/apt/sources.list /etc/apt/sources.list.d/* 2>/dev/null; then
    echo "Ajout du dépôt Google Chrome..."
    sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list'
    apt update -y
fi
