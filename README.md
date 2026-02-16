# 📦 Scripts d’Installation Automatisée – Linux (Bash)

## 📖 Description
Ce dépôt contient plusieurs scripts **Bash** permettant : 📥 téléchargement automatique d’applications depuis Internet, ⚙️ installation silencieuse via le gestionnaire de paquets ou à partir d’archives, ✅ vérification de présence avant installation, 📂 extraction automatique d’archives (.tar.gz, .zip), 🧹 nettoyage des fichiers temporaires et 🔁 exécution idempotente (ne réinstalle pas si déjà présent). L’objectif est d’automatiser le déploiement d’outils et de configurations sur des postes Linux.

## 🛠 Fonctionnement général
1️⃣ Vérification si l’application ou le binaire est déjà installé (`command -v`, `which`, ou vérification de paquet)  
2️⃣ Si absent : mise à jour du cache des paquets, installation via le gestionnaire de paquets **ou** téléchargement d’une archive/binaire, extraction et installation, vérification post-installation  
3️⃣ Suppression des fichiers temporaires  
4️⃣ Affichage d’un statut clair dans le terminal  
5️⃣ Retour d’un code de sortie (`0` = succès, `1` = erreur)

## 💻 Distributions supportées
- 🐧 Ubuntu  
- 🐧 Debian  
- 🎩 Fedora  
- 🔴 CentOS  
- 🏔 Arch Linux  

Gestionnaires de paquets utilisés selon la distribution : `apt`, `dnf`, `yum`, `pacman`.

## 🚀 Utilisation
Rendre le script exécutable : `chmod +x NomDuScript.sh`  
Exécution simple : `./NomDuScript.sh`  
Exécution avec privilèges administrateur : `sudo ./NomDuScript.sh`

## 🔐 Sécurité
- Vérifie la présence des paquets ou binaires avant installation  
- Télécharge uniquement depuis des URLs définies dans le script  
- Vérifie l’intégrité des fichiers via `sha256sum` (optionnel)  
- Supprime les fichiers temporaires après exécution  
- Utilise des options non interactives (`-y`, `--noconfirm`)  

⚠️ Toujours tester les scripts dans un environnement de préproduction avant un déploiement massif.

## 🧠 Commandes Bash couramment utilisées
`command -v` → Vérification de présence d’un binaire, `apt install -y` / `dnf install -y` → Installation silencieuse, `curl -L -o` ou `wget` → Téléchargement, `tar -xzf` → Extraction d’archive tar.gz, `unzip` → Extraction ZIP, `rm -f` → Nettoyage, `exit 0 / exit 1` → Codes de retour, `set -e` → Arrêt automatique en cas d’erreur.

## 🔄 Idempotence
Les scripts peuvent être relancés sans risque : ✔ Si le programme est déjà installé → arrêt propre, ✔ Sinon → installation automatique. Exemple : `if command -v nginx >/dev/null 2>&1; then echo "Nginx déjà installé"; exit 0; fi`

## 🧹 Nettoyage automatique
Supprime automatiquement les fichiers téléchargés dans `/tmp`, les archives temporaires et les dossiers d’extraction temporaires.

## 🏢 Utilisation possible en environnement professionnel
Déploiement manuel, scripts de provisioning serveur, intégration CI/CD, Cloud-init, Ansible (scripts complémentaires), outils RMM Linux.

## ⚠️ Avertissement
Ces scripts sont fournis « en l’état ». L’auteur ne peut être tenu responsable d’un mauvais usage ou d’une modification inadaptée.