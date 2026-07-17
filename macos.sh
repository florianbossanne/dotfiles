

# --- Finder (Explorateur de fichiers) ---

# Afficher les extensions de fichiers (ex: .txt, .py)
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Afficher la barre de chemin en bas des fenêtres du Finder
defaults write com.apple.finder ShowPathbar -bool true

# Afficher la barre d'état (espace disque restant, nombre d'éléments)
defaults write com.apple.finder ShowStatusBar -bool true

# Garder les dossiers en haut lors du tri par nom
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# Recherche par défaut dans le dossier actuel plutôt que sur tout le Mac
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Désactiver l'avertissement lors du changement d'une extension de fichier
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false


# --- Clavier, souris & trackpad ---

# Désactiver le défilement "naturel" (inversé) pour la SOURIS (vrai comportement Windows)
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

# Augmenter la vitesse du curseur de la souris (très lent par défaut sur Mac)
defaults write NSGlobalDomain com.apple.mouse.scaling -float 2.5

# Activer le "Tap pour cliquer" sur le trackpad (cliquer sans enfoncer physiquement le plateau)
defaults write com.apple.applemultitouchtrackpad Clicking -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true


# --- Dock et interface ---

# Réduire la taille du Dock
defaults write com.apple.dock tilesize -int 40

# Masquer automatiquement le Dock (il apparaît quand la souris va en bas)
defaults write com.apple.dock autohide -bool true

# Rendre l'apparuhhhjkhkition du Dock instantanée (supprime l'effet d'animation lent)
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0.2
