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
# if [ -d $HOME/anaconda3/ ]; then
#   export PATH="$HOME/anaconda3/bin:$PATH"
# elif [ -d $HOME/bin/anaconda/ ]; then
#   export PATH="$HOME/bin/anaconda/bin:$PATH"
# fi
## ============================================================================
###				brew python
### ===========================================================================
# Use the right python
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
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
