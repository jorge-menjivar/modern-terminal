# ZSH
cp ~/.zshenv .zshenv
cp ~/.zshrc .zshrc

# We need to make sure that the .zsh_functions dir is not copied into itself
# for that we need to remove the .zsh_functions dir from the .zsh_functions dir
rm -r .zsh_functions
cp -r ~/.zsh_functions .zsh_functions
