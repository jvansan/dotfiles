"
let g:python3_host_prog = '/usr/local/anaconda3/bin/python'

"encoding
set encoding=utf-8

let mapleader = "\<Space>"

" Line numbering
set number
set relativenumber
set shiftwidth=2
set tabstop=2
set shiftround
set expandtab

" make backspace traverse between lines
set backspace=indent,eol,start

" use system clipboard by default
set clipboard^=unnamed,unnamedplus

" Instead of failing a command because of unsaved changes, raise a dialogue
" asking if you wish to save changed files.
set confirm

" make backspace eat a tab worth of spaces
set smarttab

" Allow switching off modified buffers without warning
set hidden

" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>

