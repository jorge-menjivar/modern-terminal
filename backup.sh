#!/usr/bin/zsh

# Create the .config dir if it doesn't exist
mkdir -p .config

# Alacritty
mkdir -p .config/alacritty
# Linux
if [ "$(uname)" == "Linux" ]; then
    cp ~/.config/alacritty/alacritty.toml .config/alacritty/alacritty-linux.toml
fi
# macOS
if [ "$(uname)" == "Darwin" ]; then
    cp ~/.config/alacritty/alacritty.toml .config/alacritty/alacritty-macos.toml
fi

# Conda
cp ~/.condarc .condarc

# Starship
cp ~/.config/starship.toml .config/starship.toml

# Tmux
cp ~/.tmux.conf .tmux.conf

# Zellij
# We need to make sure that the zellij dir is not copied into itself
# for that we need to remove the zellij dir from the zellij dir
rm -r .config/zellij
cp -r ~/.config/zellij .config/zellij

#---------------------------------ZSH-------------------------------------
cd zsh
chmod +x ./backup.sh
sh ./backup.sh
cd ..
