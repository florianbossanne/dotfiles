#!/bin/bash
# Script principal d'installation.

echo "Demarrage de l'installation..."

# 1. Vérifier et installer Homebrew s'il est manquant
if ! command -v brew &> /dev/null; then
    echo "Homebrew n'est pas installé. Installation en cours..."
    
    # Ligne officielle d'installation de Homebrew
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    
    # Injection dans le profil pour les futurs démarrages du Mac
    if [[ $(uname -m) == "arm64" ]]; then
        (echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> ~/.zprofile
    else
        (echo; echo 'eval "$(/usr/local/bin/brew shellenv)"') >> ~/.zprofile
    fi
else
    echo "Homebrew est déjà installé."
fi

# 2. IMPORTANT : On active obligatoirement la commande brew pour TOUT ce script
if [[ $(uname -m) == "arm64" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
else
    eval "$(/usr/local/bin/brew shellenv)"
fi

# 3. Lancer le script brew.sh (sans ouvrir de sous-session grâce à 'source')
if [ -f "./brew.sh" ]; then
    echo "Installation des applications via brew.sh..."
    chmod +x ./brew.sh
    source ./brew.sh
else
    echo "Erreur : brew.sh n'a pas été trouvé."
fi

# 4. Lancer le script macos.sh
if [ -f "./macos.sh" ]; then
    echo "Configuration du système via macos.sh..."
    chmod +x ./macos.sh
    source ./macos.sh
else
    echo "Erreur : macos.sh n'a pas été trouvé."
fi

# 5. Redémarrer le Finder et le Dock pour valider les changements de macos.sh
echo "Application finale des réglages de l'interface..."
killall Finder &> /dev/null
killall Dock &> /dev/null

echo "Installation terminée avec succès !"
