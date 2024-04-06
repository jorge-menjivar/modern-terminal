#!/usr/bin/zsh

# This script is intended to be run on a fresh install of the OS
# It will install all the necessary software and restore the configuration files

# Check if the user is root
if [ "$(id -u)" -eq 0 ]; then
    echo "This script should not be run as root"
    exit 1
fi

mkdir -p ~/tmp

# -----------------------------User Interaction-----------------------------
DO_INSTALL_ALACRITTY=false
DO_UPDATE_BREW=false

# Ask the user if they want to install Alacritty
if [ -f /etc/redhat-release ] || [ -f /etc/debian_version ]; then
    read -p "Do you want to install Alacritty? (y/n) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        DO_INSTALL_ALACRITTY=true
    fi
fi

# Ask the user if they want to upgrade all the installed software
if [ -f /etc/redhat-release ] || [ -f /etc/debian_version ] || [ -f /usr/bin/sw_vers ]; then
    read -p "Do you want to update all brew packages? (recommended) (y/n) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        DO_UPDATE_BREW=true
    fi
fi
# -----------------------------------ZSH-------------------------------------
# Install zsh and its dependencies
cd zsh
chmod +x ./install.sh # Prevent permission denied error
sh ./install.sh
cd ..

# ----------------------------------Brew------------------------------------
# Install Homebrew if not installed
cd brew
chmod +x ./install.sh # Prevent permission denied error
sh ./install.sh
cd ..

# ----------------------------------Git-------------------------------------
# Install git to make sure it is in latest version
# if the os is fedora or redhat
if [ -f /etc/redhat-release ]; then
    sudo dnf install git
fi

# if the os is ubuntu or debian
if [ -f /etc/debian_version ]; then
    sudo apt update
    sudo apt install git
fi

# if the os is macOS,
if [ -f /usr/bin/sw_vers ]; then
    brew install git
fi

# -----------------------------------Rust------------------------------------
# Install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source $HOME/.cargo/env

# -----------------------------------Python----------------------------------
# Install pipx and poetry
cd python
chmod +x ./install.sh # Prevent permission denied error
sh ./install.sh
cd ..

# ---------------------------------Alacritty---------------------------------
# Install Alacritty if the user wants to
# if the os is fedora or redhat
if [ -f /etc/redhat-release ]; then
    if [ $DO_INSTALL_ALACRITTY = true ]; then
        sudo dnf install alacritty

        # Update desktop entries
        sudo update-desktop-database

        # Set Alacritty as the default terminal
        sudo update-alternatives --config x-terminal-emulator
    fi
fi

# if the os is ubuntu or debian
if [ -f /etc/debian_version ]; then
    if [ $DO_INSTALL_ALACRITTY = true ]; then
        sudo apt update
        sudo apt install alacritty -y

        # Update desktop entries
        sudo update-desktop-database

        # Set Alacritty as the default terminal
        sudo update-alternatives --config x-terminal-emulator
    fi
fi

# if the os is macOS,
if [ -f /usr/bin/sw_vers ]; then
    if [ $DO_INSTALL_ALACRITTY = true ]; then
        brew install alacritty
    fi
fi

# ------------------------------------Zellij---------------------------------
# if the os is fedora or redhat
if [ -f /etc/redhat-release ]; then
    sudo dnf copr enable varlad/zellij -y
    sudo dnf install zellij
fi

# if the os is ubuntu or debian
if [ -f /etc/debian_version ]; then
    sudo apt install zellij -y
fi

# if the os is macOS,
if [ -f /usr/bin/sw_vers ]; then
    brew install zellij
fi

# -----------------------------------Starship--------------------------------
brew install starship

# -----------------------------------ripgrep---------------------------------
# Ripgrep (grep command replacement)
brew install ripgrep

# -------------------------------------bat-----------------------------------
# Bat (cat command replacement)
brew install bat
brew install eth-p/software/bat-extras-prettybat # Prettybat (bat plugin): colorizes the output of bat
brew install eth-p/software/bat-extras-batman    # Batman (bat plugin): read man pages with bat
brew install eth-p/software/bat-extras-batgrep   # Batgrep (bat plugin): search for a pattern in files using bat. Requires ripgrep

# ----------------------------------Nerd Fonts-------------------------------
# Nerd Font (LiberationMono)
# Download the font to tmp dir
curl -Lo "/tmp/LiberationMono.zip" "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.0/LiberationMono.zip"

# Unzip and move the font to the fonts dir. Updates the fonts if they already exist.
# Linux
if [ "$(uname -s)" = "Linux" ]; then
    unzip -o "/tmp/LiberationMono.zip" -d "~/.local/share/fonts"
    fc-cache -f -v # Update the font cache
fi

# macOS
if [ "$(uname -s)" = "Darwin" ]; then
    unzip -o "/tmp/LiberationMono.zip" -d "/Library/Fonts/"
fi

rm "/tmp/LiberationMono.zip" # Clean up

# ------------------------------------Node-----------------------------------
# Install node version manager
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

source ~/.zshrc

# Install latest lts version of node
nvm install --lts

# ------------------------------------PNPM-----------------------------------
# Install pnpm package manager
curl -fsSL https://get.pnpm.io/install.sh | sh -

# ------------------------------------Neovim---------------------------------
# Install Neovim and its dependencies
cd nvim
chmod +x ./install.sh # Prevent permission denied error
sh ./install.sh
cd ..

# ------------------------------------Brew upgrade---------------------------
# Upgrade all the installed software if the user wants to
if [ $DO_UPDATE_BREW = true ]; then
    brew upgrade
fi

# -----------------------Restore configuration files-------------------------
# Execute the quick restore script
chmod +x restore.sh # Prevent permission denied error
sh ./restore.sh

# -----------------------------Clean up--------------------------------------
rm -rf ~/tmp
