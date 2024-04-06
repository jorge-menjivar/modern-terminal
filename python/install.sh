# ----------------------------PIPX--------------------------------
# Install pipx
# if the os is fedora or redhat
if [ -f /etc/redhat-release ]; then
  sudo dnf install pipx
  pipx ensurepath
  sudo pipx ensurepath --global # optional to allow pipx actions in global scope. See "Global installation" section below.
fi

# if the os is ubuntu or debian
if [ -f /etc/debian_version ]; then
  sudo apt update
  sudo apt install pipx
  pipx ensurepath
  sudo pipx ensurepath --global # optional to allow pipx actions in global scope. See "Global installation" section below.
fi

# if the os is macOS,
if [ -f /usr/bin/sw_vers ]; then
  brew install pipx
  pipx ensurepath
  sudo pipx ensurepath --global # optional to allow pipx actions in global scope. See "Global installation" section below.
fi

# -----------------------------Poetry-------------------------------
pipx install poetry
