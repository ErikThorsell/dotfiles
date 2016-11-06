" Compile grammar and make it.
noremap <C-w><C-w> :w ! bnfc -d % && make <Enter>
