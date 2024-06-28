# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '$HOME/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
COMPLETION_WAITING_DOTS="true"

plugins=(
    history
    poetry
    sudo
    virtualenv
    zsh-syntax-highlighting
    zsh-autosuggestions
    zsh-github-copilot
)

fpath+=${ZDOTDIR:-~}/.zsh_functions
source $ZSH/oh-my-zsh.sh

bindkey -M emacs '``' sudo-command-line # bind `` to sudo-command-line in command mode
bindkey -M vicmd '``' sudo-command-line # bind `` to sudo-command-line in command mode
bindkey -M viins '``' sudo-command-line # bind `` to sudo-command-line in insert mode
bindkey '^\' zsh_gh_copilot_explain     # bind Ctrl+\ to explain with copilot
bindkey '^[\' zsh_gh_copilot_suggest    # bind Alt+\ to suggest with copilot

# if macOS
if [[ "$OSTYPE" == darwin* ]]; then
    bindkey '«' zsh_gh_copilot_suggest # bind Option+\ to suggest with copilot
fi

# export JAVA_HOME="/usr/lib/jvm/java-11-openjdk-11.0.17.0.8-1.fc37.x86_64"
export ANDROID_HOME="$HOME/.android/sdk"
export ANDROID_SDK_ROOT="$ANDROID_HOME"
export NDK_HOME="$ANDROID_HOME/ndk/25.1.8937393"
export PATH="$PATH:/usr/NX/bin"
export PATH="$PATH:$HOME/aseprite/build/bin"
export PATH="$PATH:$HOME/flutter/bin"
export PATH="$PATH:$HOME/.pub-cache/bin"
export PATH="$PATH:$HOME/android-studio/bin"
export PATH="$PATH:$ANDROID_HOME/cmdline-tools/latest/bin"
export PATH="$PATH:$ANDROID_HOME/emulator"
export PATH="$PATH:$ANDROID_HOME/tools"
export PATH="$PATH:$ANDROID_HOME/platform-tools"
export PATH="$PATH:$NDK_HOME"
export CHROME_EXECUTABLE=brave-browser

export CALIBRE_USE_SYSTEM_THEME=0
export CALIBRE_USE_DARK_PALETTE=1

export CAPACITOR_ANDROID_STUDIO_PATH="$HOME/.local/share/JetBrains/Toolbox/apps/AndroidStudio/ch-0/211.7628.21.2111.8309675/bin/studio.sh"

export QT_QPA_PLATFORM=wc
export ANSIBLE_CONFIG=$HOME/.config/ansible/ansible.cfg

export DENO_INSTALL="$HOME/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export FLYCTL_INSTALL="$HOME/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"

if [ -r ~/.zshkeys ]; then
    source ~/.zshkeys
fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

eval "$(starship init zsh)"

# ---------------- Aliases --------------------------

# if on wayland, then use the following aliases

if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
    alias brave="brave --ozone-platform=wayland --ozone-platform-hint=auto --enable-features=WaylandWindowDecorations"
    alias codium="codium --ozone-platform-hint=auto --enable-features=WaylandWindowDecorations"
    alias code="code --ozone-platform-hint=auto --enable-features=WaylandWindowDecorations"
    alias cursor="$HOME/Applications/cursor-*.AppImage --ozone-platform-hint=auto --enable-features=WaylandWindowDecorations"
    alias slack="slack --ozone-platform-hint=auto --enable-features=WaylandWindowDecorations,UseOzonePlatform,WebRTCPipeWireCapturer"
    alias redis-insight="$HOME/Applications/RedisInsight-linux-x86_64.AppImage --ozone-platform-hint=auto --enable-features=WaylandWindowDecorations"
fi

# Bat aliases
alias cat="prettybat"
alias man="batman"

# ---------------- Mamba aliases --------------------
alias m="mamba"
alias ma="mamba activate"
alias md="mamba deactivate"
alias mi="mamba install"
alias mu="mamba uninstall"

# ---------------- TMUX aliases ---------------------
# alias t="tmux"
alias t="zellij"

# ---------------- git aliases ----------------------
alias g="git"
alias gi="git init"
alias gpl="git pull"
alias ga="git add"
alias gc="git commit"
alias gps="git push"
alias gs="git status"
alias gf="git fetch"
alias gsw="git switch"
alias gr="git remote"
alias gb="git branch"
alias gcl="git clone"
alias gl="git log"

# ------------------ grep aliases ---------------------------
alias grep="rg --color=auto"

# ----------------- Neo Vim aliases --------------------------
alias v=nvim
alias vi=nvim
alias vim=nvim
alias cr="printf '\033[6 q'"

# ----------------- Flatpak aliases --------------------------
alias calibre="flatpak run com.calibre_ebook.calibre"
alias postman="GDK_BACKEND=wayland flatpak run com.getpostman.Postman --ozone-platform=wayland --ozone-platform-hint=auto --enable-features=WaylandWindowDecorations"

#--------------------Copy and Paste---------------------------
# If Linux
if [ "$(uname -s)" = "Linux" ]; then
    # Use wl-copy if on wayland, otherwise use xclip
    if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
        alias copy="wl-copy"
        alias paste="wl-paste"
    else
        alias copy="xclip -selection clipboard"
        alias paste="xclip -selection clipboard -o"
    fi
fi

# If macOS
if [ "$(uname -s)" = "Darwin" ]; then
    alias copy="pbcopy"
    alias paste="pbpaste"
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

export CARGO_PROFILE_DEV_BUILD_OVERRIDE_DEBUG=true

export EDITOR=nvim
