#!/bin/bash
# Script principal d'installation.

echo "Demarrage de l'installation..."

# Vérifier et installer Homebrew s'il n'est pas présent.
if ! command -v brew &> /dev/null; then
    echo "Homebrew n'est pas installé. Installation en cours..."

    # Ligne officielle d'installation de Homebrew (requis sur une session neuve)
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # Configuration de la session selon l'architecture
    if [[ $(uname -m) == "arm64" ]]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
        (echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> ~/.zprofile
    else
        eval "$(/usr/local/bin/brew shellenv)"
        (echo; echo 'eval "$(/usr/local/bin/brew shellenv)"') >> ~/.zprofile
    fi
else
    echo "Homebrew est déjà installé."
fi

# IMPORTANT : Charger l'environnement dans l'instance actuelle pour la suite du script
if [[ $(uname -m) == "arm64" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
else
    eval "$(/usr/local/bin/brew shellenv)"
fi

# Lancer le script brew.sh
if [ -f "./brew.sh" ]; then
    echo "Installation des applications via brew.sh..."

    # Donner la permission
    chmod +x ./brew.sh

    # Lancer le script avec source pour conserver l'environnement Homebrew
    source ./brew.sh
else
    echo "Erreur : brew.sh n'a pas été trouvé."
fi

# Lancer le script macos.sh
if [ -f "./macos.sh" ]; then
    chmod +x ./macos.sh
    source ./macos.sh
else
    echo "Erreur : macos.sh n'a pas été trouvé."
fi

echo "Installation terminée avec succès !"
