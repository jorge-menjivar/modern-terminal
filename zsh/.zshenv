export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="$HOME/.local/bin":$PATH

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('$HOME/mambaforge/bin/conda' 'shell.zsh' 'hook' 2>/dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/mambaforge/etc/profile.d/conda.sh" ]; then
        . "$HOME/mambaforge/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/mambaforge/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "$HOME/mambaforge/etc/profile.d/mamba.sh" ]; then
    . "$HOME/mambaforge/etc/profile.d/mamba.sh"
fi
# <<< conda initialize <<<
. "$HOME/.cargo/env"

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
*":$PNPM_HOME:"*) ;;
*) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
