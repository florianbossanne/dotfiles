#!/bin/bash
# Script principal d'installation.

echo "Demarrage de l'installation..."

# Vérifier et installer Homebrew.
if ! command -v brew &> /dev/null; then
    echo "Homebrew n'est pas installé. Installation en cours..."

    if [[ $(uname -m) == "arm64" ]]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    else
        eval "$(/usr/local/bin/brew shellenv)"
    fi
else
    echo "Homebrew est déjà installé."
fi

# Lancer le script brew.sh
if [ -f "./brew.sh" ]; then
    echo "Installation des applications via brew.sh..."

    # Donner la permission
    chmod +x ./brew.sh

    # Lancer le script
    ./brew.sh
else
    echo "Erreur : brew.sh n'a pas été trouvé."
fi

echo "Installation terminée avec succès !"
