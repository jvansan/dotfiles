## ============================================================================
###                                 Settings
### ============================================================================j
# NCBI API-key
[ -f ~/.zsh/ncbi_api.key ] &&  source ncbi_api.key

# Don't save duplicated entries into history
setopt hist_ignore_all_dups

# Hack to fix Homebrew
if [ "$(uname)" = "Darwin" ]; then
	export PATH=/usr/local/bin:$PATH
fi

## ============================================================================
###                                  Prompt
### ============================================================================
git_prompt_info_mine() {
    git_prompt_text="$(git symbolic-ref HEAD 2>/dev/null | cut -d'/' -f3)" || ""
    if [[ -n $git_prompt_text ]]; then
        echo " <$git_prompt_text>"
    else
        echo ""
    fi
}
PROMPT='%{$fg[green]%}%m %{$fg[cyan]%}%c%{$fg[yellow]%}$(git_prompt_info_mine)%{$reset_color%} $ '

## ============================================================================
###                                  Anaconda
### ============================================================================
conda_activate () {
	if [ -d $HOME/anaconda3/ ]; then
	  export PATH="$HOME/anaconda3/bin:$PATH"
	else
	  echo "Anaconda Python does not appear to be installed"
	fi
}
## ============================================================================
###				     Python
### ===========================================================================
# Use the right python
if [ "$(uname)" = "Darwin" ]; then
	export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
else
	export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
fi

# Activate virtualenv wrapper
[ -f /usr/local/bin/virtualenvwrapper.sh ] && source /usr/local/bin/virtualenvwrapper.sh

# pip only available if virtual env activated
export PIP_REQUIRE_VIRTUALENV=true

# command to override pip restriction
gpip() {
	PIP_REQUIRE_VIRTUALENV="" pip "$@"
}

gpip3() {
	PIP_REQUIRE_VIRTUALENV="" pip3 "$@"
}

#  ============================================================================
#                                   FZF
#  ============================================================================
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
