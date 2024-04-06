# Install zsh and change the default shell to zsh
# if the os is fedora or redhat
if [ -f /etc/redhat-release ]; then
  sudo dnf install zsh util-linux-user

  # if default shell is not zsh, change it to zsh
  if [ "$(echo $SHELL)" != "$(which zsh)" ]; then
    # Must emulate pressing enter for the `sudo lchsh $USER $(which zsh)` command
    echo |
      sudo lchsh $USER $(which zsh)
  fi
fi

# if the os is ubuntu or debian
if [ -f /etc/debian_version ]; then
  sudo apt install zsh

  # if default shell is not zsh, change it to zsh
  if [ "$(echo $SHELL)" != "$(which zsh)" ]; then
    sudo chsh -s $(which zsh)
  fi
  sudo chsh -s $(which zsh)
fi

# if the os is macOS,
if [ -f /usr/bin/sw_vers ]; then
  brew install zsh
  # arm architecture (m chips)
  if [ "$(uname -m)" = "arm64" ]; then

    # if default shell is not zsh, change it to zsh
    if [ "$(echo $SHELL)" != "$(which zsh)" ]; then
      chsh -s $(which zsh)
    fi
  fi
  # intel architecture
  if [ "$(uname -m)" = "x86_64" ]; then
    if [ "$(echo $SHELL)" != "$(which zsh)" ]; then
      chsh -s $(which zsh)
    fi
  fi
fi

# -----------------------------------OhMyZsh---------------------------------
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

rm -rf ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
rm -rf ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/loiccoyle/zsh-github-copilot ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-github-copilot

# Install github cli
# if the os is fedora or redhat
if [ -f /etc/redhat-release ]; then
  sudo dnf install 'dnf-command(config-manager)'
  sudo dnf config-manager --add-repo https://cli.github.com/packages/rpm/gh-cli.repo
  sudo dnf install gh -y
fi

# if the os is ubuntu or debian
if [ -f /etc/debian_version ]; then
  sudo mkdir -p -m 755 /etc/apt/keyrings && wget -qO- https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg >/dev/null &&
    sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg &&
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list >/dev/null &&
    sudo apt update &&
    sudo apt install gh -y
fi

# if the os is macOS,
if [ -f /usr/bin/sw_vers ]; then
  brew install gh
fi

gh auth login --web -h github.com
gh extension install github/gh-copilot --force
