call plug#begin('~/.vim/plugged')

" fzf support
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'
Plug 'morhetz/gruvbox'                                  " Color theme

Plug 'bling/vim-airline'                                " status bar 
" Plug 'Valloric/YouCompleteMe'                         " auto-completion 
" Plug 'cjrh/vim-conda'                                 " Conda support in vim
if has("nvim")
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1

Plug 'davidhalter/jedi-vim'                             " auto-complete python
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'wokalski/autocomplete-flow'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/neco-vim'                                  " 
Plug 'sbdchd/neoformat'                                 " Auto formatting
Plug 'w0rp/ale'                                         " linter 
Plug 'mhinz/vim-startify'                               " startup page 
Plug 'Townk/vim-autoclose'                              " close parens 
Plug 'Yggdroot/indentLine'                              " show indent 
Plug 'junegunn/vim-easy-align'                          " align stuff 
Plug 'luochen1990/rainbow'                              " rainbow parens 
Plug 'ctrlpvim/ctrlp.vim'                               " fuzzy file open
Plug 'tpope/vim-commentary'                             " comment functions
Plug 'vim-airline/vim-airline-themes'                   " Status line themes
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}    " tree nav


call plug#end()

"====================
"| Plugin Settings  |
"====================
" colortheme
colorscheme gruvbox
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

" Ale
" turn off convention pylint messages and misc
let g:ale_python_pylint_options='--disable=C --disable=W0311 --disable=W0703'

" YouCompleteMe
" let g:ycm_autoclose_preview_window_after_insertion=1

" airline
let g:airline_powerline_fonts=1
let g:airline_theme='dark'

" Jedi code nav
let g:jedi#completions_enabled = 0

" Deoplete
let g:neosnippet#enable_completed_snippet = 1

" Enable alignment
let g:neoformat_basic_format_align = 1

" Enable tab to spaces conversion
let g:neoformat_basic_format_retab = 1

