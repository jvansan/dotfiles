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
# PROMPT='%{$fg[green]%}%m %{$fg[cyan]%}%c%{$fg[yellow]%}$(git_prompt_info_mine)%{$reset_color%} $ '

#  ============================================================================
#                                   FZF
#  ============================================================================
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
