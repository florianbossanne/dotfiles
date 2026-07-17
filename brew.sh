#!/bin/bash
# Installer les logiciels via Homebrew.

# Utiliser la dernière version.
brew update

# Mettre à jour les outils déjà installés.
brew upgrade

# --- Les binaries (CLI) ---
brew install git
brew install coreutils
brew install wget
brew install node
brew install tree
brew install python
brew install uv
brew install ruff
brew install cmake

# --- Les applications (GUI) ---
brew install --cask google-chrome
brew install --cask firefox
brew install --cask microsoft-teams
brew install --cask zoom
brew install --cask onedrive
brew install --cask keepassxc
brew install --cask spotify
brew install --cask messenger
brew install --cask whatsapp
brew install --cask slack
brew install --cask discord
brew install --cask steam
brew install --cask vlc
brew install --cask pdfsam-basic
brew install --cask tradingview
brew install --cask visual-studio-code
brew install --cask docker
brew install --cask iterm2
brew install --cask raycast

# Nettoyer les fichiers d'installation.
brew cleanup
