alias grep='grep --color=auto'
alias la='ls -a'
alias less='less -N'
alias m='less -N'
alias tmux='tmux -2u'

# MasOS specific
if [ "$(uname)" = "Darwin" ]; then
	alias atom='/Applications/Atom.app/Contents/MacOS/Atom'
	alias apm='/Applications/Atom.app/Contents/Resources/app/apm/bin/apm'
fi

# Linux specific
if [ "$(uname)" = "Linux" ]; then
	alias open='gio open'
fi
