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
if [ -d $HOME/anaconda3/ ]; then
  export PATH="$HOME/anaconda3/bin:$PATH"
elif [ -d $HOME/bin/anaconda/ ]; then
  export PATH="$HOME/bin/anaconda/bin:$PATH"
fi
