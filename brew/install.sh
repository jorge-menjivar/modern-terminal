# ----------------------------------Brew------------------------------------
# Install Homebrew if not installed
if ! command -v brew &>/dev/null; then
  echo "Homebrew is not installed. Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  # Add Homebrew to PATH
  # if the os is fedora or redhat
  if [ -f /etc/redhat-release ]; then
    echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >>~/.zprofile
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
  fi

  # if the os is ubuntu or debian
  if [ -f /etc/debian_version ]; then
    echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >>~/.zprofile
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
  fi

  # if the os is macOS,
  if [ -f /usr/bin/sw_vers ]; then
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >>~/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
  fi

fi
