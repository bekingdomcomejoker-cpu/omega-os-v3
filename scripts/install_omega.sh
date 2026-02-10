#!/bin/bash
# ============================================================================
# OmegaOS v3.4 - Installation Script
# ============================================================================

set -e

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

log() { echo -e "${GREEN}[INSTALL]${NC} $1"; }
warn() { echo -e "${YELLOW}[WARN]${NC} $1"; }
error() { echo -e "${RED}[ERROR]${NC} $1"; }

log "OmegaOS v3.4 Installation Starting..."

# Create directories
log "Creating directory structure..."
mkdir -p ~/OMEGAOS/{bin,lib,config,data,logs}

# Copy files
log "Installing core files..."
cp scripts/omegaos_enhanced_v34.sh ~/OMEGAOS/bin/
cp python-modules/omega_complete.py ~/OMEGAOS/lib/
chmod +x ~/OMEGAOS/bin/omegaos_enhanced_v34.sh
chmod +x ~/OMEGAOS/lib/omega_complete.py

# Create symbolic links
log "Creating command links..."
ln -sf ~/OMEGAOS/lib/omega_complete.py ~/OMEGAOS/bin/omega

# Update PATH
log "Updating PATH..."
if ! grep -q "OMEGAOS/bin" ~/.bashrc 2>/dev/null; then
    echo 'export PATH="$HOME/OMEGAOS/bin:$PATH"' >> ~/.bashrc
fi

log "✅ Installation complete!"
log "Run: source ~/.bashrc"
log "Then: omega test"
