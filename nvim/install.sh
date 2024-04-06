source ~/.zshrc

# Install Neovim
# if the os is fedora or redhat
if [ -f /etc/redhat-release ]; then
    sudo dnf install neovim
fi

# if the os is ubuntu or debian
if [ -f /etc/debian_version ]; then
    sudo apt install neovim
fi

# if the os is macOS,
if [ -f /usr/bin/sw_vers ]; then
    brew install neovim
fi

# Install neovim dependencies
/usr/bin/python3 -m pip install -U setuptools pynvim 'python-lsp-server[all]' pyright ruff-lsp

# if the os is Linux,
if [ "$(uname -s)" = "Linux" ]; then
    git clone https://github.com/universal-ctags/ctags.git ./tmp/ctags
    cd ./tmp/ctags
    ./autogen.sh
    ./configure
    make
    sudo make install
    cd ..
    cd ..
fi

# if the os is macOS,
if [ -f /usr/bin/sw_vers ]; then
    brew install ctags
fi

npm install -g vim-language-server

rm -rf ~/.config/nvim

cp -r ./conf ~/.config/nvim
