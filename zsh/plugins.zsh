# load zgen
source "${HOME}/.dotfiles/zgen/zgen.zsh"

# Only generate init script if not there
# Regenerate by "rm ~/.zgen/init.zsh"
if ! zgen saved; then
	echo "Creating a zgen save"

	zgen oh-my-zsh

	# oh-my-zsh plugins
	zgen oh-my-zsh plugins/colorize

	# update zgen and plugins automatically
	zgen load unixorn/autoupdate-zgen
	zgen oh-my-zsh themes/robbyrussell

	# Github plugins
	zgen load rupa/z
	zgen load zsh-users/zsh-autosuggestions
	zgen load zsh-users/zsh-completions

	# generate the init script
	zgen save
fi

