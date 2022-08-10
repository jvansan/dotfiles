" Save and number python script if filetype is .py 
autocmd filetype python nnoremap <buffer> <F12> :w<CR> :exec '!python' shellescape(@%, 1)<cr>

" Block comment 
noremap <leader>/ :Commentary<cr>

"" ============================================================================
""                           Insert Mode Mappings
"" ============================================================================
" Leaving insert mode with some ups and downs
inoremap kj <Esc>

" Ycm 
" nnoremap <leader> yy   :YcmCompleter GoTo<CR>
if has("nvim")
  tnoremap <Esc> <C-\><C-n>
endif
