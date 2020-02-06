" Save and number python script if filetype is .py 
autocmd filetype python nnoremap <buffer> <F12> :w<CR> :exec '!python' shellescape(@%, 1)<cr>

" Block comment 
noremap <leader>/ :Commentary<cr>

" This is totally awesome - remap jj to escape in insert mode. You'll never
" type jj anyway, so it's great!
inoremap jj <Esc>

" Ycm 
" nnoremap <leader> yy   :YcmCompleter GoTo<CR>
