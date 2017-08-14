call plug#begin('~/.vim/plugged')

Plug 'Valloric/YouCompleteMe'
Plug 'w0rp/ale'
Plug 'lervag/vimtex'
Plug 'mhinz/vim-startify'
Plug 'Townk/vim-autoclose'

call plug#end()

"====================
"| Plugin Settings  |
"====================
let g:vimtex_compiler_latexmk = {'callback' : 0}