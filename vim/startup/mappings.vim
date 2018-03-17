" Save and number python script if filetype is .py 
autocmd filetype python nnoremap <buffer> <F1> :w<CR> :exec '!python' shellescape(@%, 1)<cr>
" Block comment 
noremap <leader>/ :Commentary<cr>
