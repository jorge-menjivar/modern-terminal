#!/usr/bin/zsh

# This can be run as many times as you want. It will not install the software again,
# but it will restore the configuration files.

# Create the .config dir if it doesn't exist
mkdir -p ~/.config

# Alacritty
mkdir -p ~/.config/alacritty

# -----------------------------ZSH-----------------------------
cd zsh
chmod +x ./restore.sh
sh ./restore.sh
cd ..

# Alacritty
# Linux
if [ "$(uname -s)" == "Linux" ]; then
    cp .config/alacritty/alacritty-linux.toml ~/.config/alacritty/alacritty.toml
fi
# macOS
if [ "$(uname -s)" == "Darwin" ]; then
    cp .config/alacritty/alacritty-macos.toml ~/.config/alacritty/alacritty.toml
fi

# Conda
cp .condarc ~/.condarc

# Starship
cp .config/starship.toml ~/.config/starship.toml

# Tmux
cp .tmux.conf ~/.tmux.conf

# Zellij
# We need to make sure that the zellij dir is not copied into itself
# for that we need to remove the zellij dir from the zellij dir
rm -r ~/.config/zellij
cp -r .config/zellij ~/.config/zellij

#---------------------------------Neovim-------------------------------------
# Restore the Neovim configuration
cd nvim
chmod +x ./restore.sh
sh ./restore.sh
cd ..
