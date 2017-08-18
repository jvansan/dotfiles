echo "Loading zshrc"


source ~/.zsh/plugins.zsh
source ~/.zsh/aliases.zsh
source ~/.zsh/settings.zsh

# g09
g09root="/home/jvansan/bin"; export g09root
source $g09root/g09/bsd/g09.profile
export GAUSS_SCRDIR="/home/jvansan/scratch"
