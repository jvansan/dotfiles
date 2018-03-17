call plug#begin('~/.vim/plugged')

Plug 'bling/vim-airline'				" status bar 
Plug 'Valloric/YouCompleteMe'				" auto-completion 
Plug 'w0rp/ale'						" linter 
Plug 'mhinz/vim-startify'				" startup page 
Plug 'Townk/vim-autoclose' 				" close parens 
Plug 'Yggdroot/indentLine'                              " show indent 
Plug 'junegunn/vim-easy-align'				" align stuff 
Plug 'luochen1990/rainbow'				" rainbow parens 
Plug 'ctrlpvim/ctrlp.vim'				" fuzzy file open
Plug 'roxma/vim-tmux-clipboard'				" Vim + Tmux clipboard integration
Plug 'tpope/vim-commentary'				" comment functions

call plug#end()

"====================
"| Plugin Settings  |
"====================
" rainbow
let g:rainbow_active=1

" indentLine
let g:indentLine_char='|'
" Specify a character to  be used as indent line on the first level
let g:indentLine_first_char='¦'
" Whether the first indent level should be shown
let g:indentLine_showFirstIndentLevel=1
" Specify how much indent level do you want to use for indentLine
let g:indentLine_indentLevel=10
" Whether to show leading spaces
let g:indentLine_leadingSpaceEnabled=0
" Allow to see the concealed in the current cursor line when in normal &
" indent mode as intended
let g:indentLine_noConcealCursor=''
" ignore startify
let g:indentLine_fileTypeExclude=['startify']
