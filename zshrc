echo "Loading zshrc"


source ~/.zsh/plugins.zsh
source ~/.zsh/aliases.zsh
source ~/.zsh/settings.zsh

# Hack to fix Homebrew
export PATH=/usr/local/bin:$PATH
